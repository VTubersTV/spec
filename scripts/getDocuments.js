#!/usr/bin/env node
import fs from 'fs/promises'
import path from 'path'

const DOCUMENTS_DIR = path.resolve(process.env.DOCUMENTS_DIR || 'documents')
const README_PATH = path.resolve(process.env.README_PATH || 'README.md')

/**
 * Parse front matter from markdown content
 */
function parseFrontMatter(content) {
	const frontMatterRegex = /^---\n([\s\S]+?)\n---/
	const match = content.match(frontMatterRegex)
	if (!match) return {}
	return Object.fromEntries(
		match[1].split('\n').map((line) => {
			const [key, ...rest] = line.split(':')
			return [key.trim(), rest.join(':').trim()]
		}),
	)
}

/**
 * Read all markdown files from documents directory
 */
async function getDocuments() {
	const files = await fs.readdir(DOCUMENTS_DIR)
	return files
		.filter((file) => file.endsWith('.md'))
		.map((file) => ({
			name: file,
			path: path.join(DOCUMENTS_DIR, file),
		}))
}

/**
 * Parse existing TOC from README.md
 */
async function getToc() {
	try {
		const content = await fs.readFile(README_PATH, 'utf-8')
		const tocMatch = content.match(/<ul>([\s\S]+?)<\/ul>/)
		if (!tocMatch) return []

		const ulContent = tocMatch[1]
		const liRegex = /<li\s+id="([^"]+)"><a\s+href="([^"]+)">([^<]+)<\/a><\/li>/g
		const toc = []
		let match
		while ((match = liRegex.exec(ulContent)) !== null) {
			toc.push({
				number: toc.length + 1,
				id: match[1],
				href: match[2],
				title: match[3],
			})
		}
		return toc
	} catch (err) {
		console.warn('README.md not found or TOC missing, skipping TOC parsing.')
		return []
	}
}

/**
 * Generate TOC HTML from docs array
 */
function generateTocHtml(docs) {
	const lines = docs.map(
		(doc) =>
			`    <li id="${doc.id}"><a href="${
				doc.href || `./documents/${doc.name}`
			}">${doc.title}</a></li>`,
	)
	return `<div id="toc">\n  <ul>\n${lines.join('\n')}\n  </ul>\n</div>`
}

/**
 * Main function
 */
async function main() {
	const documents = await getDocuments()
	const toc = await getToc()

	const docsWithTitles = await Promise.all(
		documents.map(async (doc) => {
			const content = await fs.readFile(doc.path, 'utf-8')
			const frontMatter = parseFrontMatter(content)
			return {
				...doc,
				title: frontMatter.title || 'Untitled',
				id: path.basename(doc.name, '.md'),
			}
		}),
	)

	const finalDocs = docsWithTitles.map((doc) => {
		const tocEntry = toc.find((entry) => entry.id === doc.id)
		return {
			...doc,
			number: tocEntry?.number ?? null,
			href: tocEntry?.href ?? null,
		}
	})

	finalDocs.sort((a, b) => {
		if (a.number !== null && b.number !== null) return a.number - b.number
		if (a.number !== null) return -1
		if (b.number !== null) return 1
		return a.name.localeCompare(b.name)
	})

	try {
		let readmeContent = await fs.readFile(README_PATH, 'utf-8')
		const newToc = generateTocHtml(finalDocs)

		// Only update if TOC actually changed
		if (!readmeContent.includes(newToc)) {
			readmeContent = readmeContent.replace(
				/<div id="toc">[\s\S]*?<\/div>/,
				newToc,
			)
			await fs.writeFile(README_PATH, readmeContent, 'utf-8')
			console.log('✅ README.md updated successfully!')
		} else {
			console.log('✅ README.md TOC is already up-to-date. No changes needed.')
		}
	} catch (err) {
		console.warn('README.md not found or TOC section missing, skipping write.')
	}

	console.log(
		'Documents processed:\n',
		finalDocs.map((d) => `- ${d.title} (${d.name})`).join('\n'),
	)
}

// Run
main().catch((err) => {
	console.error(err)
	process.exit(1)
})
