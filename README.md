# VTubersTV Technical Specifications Document

## Executive Summary

VTubersTV is an open-source, non-profit streaming platform designed specifically for VTuber content. This document outlines the technical specifications and architecture of the platform, detailing its components, infrastructure, and implementation guidelines.

## Table of Contents

1. [How we work](./documents/1-governance.md)
2. [System Architecture](./documents/2-system-architecture.md)
3. [Security](./documents/3-security.md)
4. [Technical Stack](./documents/4-technical-stack.md)
5. [Live Streaming](./documents/5-live-streaming.md)
6. [Live Chat](./documents/6-chat-system.md)
7. [Versioning](./documents/7-versions.md)
8. [Moderation](./documents/8-moderation.md)
9. [Moderation Handbook](./documents/9-mod-handbook.md)
10. [Appeals](./documents/10-appeals.md)
11. [Streaming](./documents/11-streaming.md)
12. [Models](./documents/12-models.md)
13. [Network](./documents/13-network.md)

<details>
<summary>What is open-source software?</summary>

Open-source software is like a recipe that everyone can see, use, and improve. When software is "open-source":

- Anyone can view the complete code (like seeing all the ingredients and steps in a recipe)
- Anyone can use the software for free
- Anyone can suggest improvements or fix problems
- Anyone can modify it for their own use
- The community works together to make it better

In the context of VTubersTV:
- All our code is publicly available on [GitHub](https://github.com)
- You can see exactly how everything works
- There are no secret algorithms or hidden features
- The community can verify that the platform is safe and respects privacy
- Developers can contribute improvements

Learn more:
- [What is Open Source? (Simple English Wikipedia)](https://simple.wikipedia.org/wiki/Open-source_software)
- [Open Source Initiative](https://opensource.org/osd)
- [Why Open Source Matters](https://www.redhat.com/en/topics/open-source/what-is-open-source)
</details>

<details>
<summary>Why create another streaming platform?</summary>

VTubersTV was created to address several needs in the VTuber community:

1. **VTuber-First Design**
   - Built specifically for VTuber content
   - Features tailored to VTuber creators and viewers
   - Tools optimized for avatar-based streaming

2. **Creator Benefits**
   - More favorable revenue sharing
   - Better control over content and data
   - Specialized tools for VTuber content creation

3. **Community Focus**
   - Platform decisions driven by community needs
   - Not controlled by large corporations
   - Transparent development and operations

4. **Innovation**
   - Open-source allows for rapid innovation
   - Community can develop new features
   - Faster response to creator needs

Learn more:
- [What is a VTuber? (Wikipedia)](https://en.wikipedia.org/wiki/VTuber)
- [History of Live Streaming](https://en.wikipedia.org/wiki/Live_streaming)
- [Community-Driven Development](https://en.wikipedia.org/wiki/Community-driven_development)
</details>

<details>
<summary>How can I help with the project?</summary>

There are many ways to contribute, regardless of your technical skills:

1. **For Non-Programmers**
   - Report bugs you find
   - Suggest new features
   - Help translate content
   - Create or improve documentation
   - Join community discussions
   - Share the project with others
   - Help test new features

2. **For Programmers**
   - Fix bugs in the code
   - Add new features
   - Review other people's code
   - Help with technical documentation
   - Improve performance
   - Write tests

3. **Getting Started**
   - Join our [Discord community](https://choco.rip/s/vtuberstv)
   - Read our [Contributing Guidelines](./CONTRIBUTING.md)
   - Look for issues tagged "Good First Issue"
   - Ask questions in our community channels

Learn more:
- [How to Contribute to Open Source (GitHub Guide)](https://opensource.guide/how-to-contribute/)
- [What is GitHub?](https://en.wikipedia.org/wiki/GitHub)
- [Understanding Version Control](https://en.wikipedia.org/wiki/Version_control)
</details>

<details>
<summary>What is the GPL license and why does it matter?</summary>

The GNU General Public License (GPL) is like a set of rules that protect the open-source nature of software. Think of it as a "sharing is caring" agreement.

**Key Points in Simple Terms:**
- You can use the software for free
- You can modify the software
- You can share the software
- If you share modified versions, you must:
  - Share your changes with others
  - Keep the same license
  - Give credit to the original project

**Why We Chose GPL:**
1. It ensures VTubersTV stays open-source forever
2. All improvements benefit the entire community
3. Prevents companies from taking the code and making it private
4. Protects the community-driven nature of the project

**What This Means for Users:**
- The platform will always be transparent
- You can trust how your data is handled
- The community maintains control
- Features will always serve users, not corporations

Learn more:
- [GNU GPL License Explained Simply](https://www.gnu.org/licenses/gpl-3.0.en.html)
- [Software Licenses (Wikipedia)](https://en.wikipedia.org/wiki/Software_license)
- [What is Copyleft?](https://en.wikipedia.org/wiki/Copyleft)
- [Free Software Foundation](https://www.fsf.org/)
</details>

<details>
<summary>Is VTubersTV really free?</summary>

Yes! VTubersTV is free in two important ways:

1. **Free to Use**
   - No cost to watch streams
   - Optional support for creators
   - No hidden fees

2. **Free as in Freedom**
   - Open-source code
   - Transparent operations
   - Community-controlled
   - No corporate oversight

**How We Sustain the Platform:**
- Community donations
- Cheap premium subscriptions
- Optional creator subscriptions
- Sponsorships
- All financial information is public
- Revenue primarily goes to creators and platform maintenance

**How is money split?**
- 60% goes to creators
- 30% goes to the platform (server costs, etc.)
- 10% goes to the community (events, giveaways, etc.)

Learn more:
- ["Free as in Freedom" Explained](https://en.wikipedia.org/wiki/Free_software)
- [Sustainable Open Source](https://opensource.guide/getting-paid/)
- [Platform Cooperativism](https://en.wikipedia.org/wiki/Platform_cooperative)
</details>

<details>
<summary>What makes VTubersTV different from other platforms?</summary>

VTubersTV stands out in several key ways:

1. **VTuber-Specific Features**
   - Avatar tracking optimization
   - Model-friendly encoding
   - Support for different model types
      - 2D/3D models
      - Live 2D/3D models
      - Static 2D/3D models
      - VRChat models
   - Specialized chat interactions
   - VTuber-focused discovery

2. **Technical Advantages**
   - Ultra-low latency streaming
   - High-quality model rendering
   - Efficient bandwidth usage
   - Better mobile support
   - Advanced chat features

3. **Community Ownership**
   - Democratic decision making
   - Transparent operations
   - Community-driven features
   - Fair monetization
   - Open development

4. **Privacy Focus**
   - No tracking or analytics
   - Data minimization
   - Local processing
   - Strong encryption
   - User control

Learn more:
- [VTuber Technology](https://en.wikipedia.org/wiki/Virtual_YouTuber#Technology)
- [Streaming Technology](https://en.wikipedia.org/wiki/Streaming_media)
- [Community Ownership](https://en.wikipedia.org/wiki/Platform_cooperative)
</details>

<details>
<summary>How does content moderation work?</summary>

Our moderation system is community-driven and transparent:

1. **Moderation Levels**
   - Community moderators
   - Channel moderators
   - AI assistance
   - Appeals system
   - Public moderation logs

2. **Content Guidelines**
   - Clear community standards
   - Cultural sensitivity
   - Age-appropriate content
   - Fair enforcement
   - Regular reviews

3. **Tools and Features**
   - Real-time chat filtering
   - Content warnings
   - Report system
   - Moderator dashboard
   - Analytics and trends

4. **Appeals Process**
   - Fair hearing
   - Community review
   - Quick resolution
   - Transparency
   - Learning opportunities

Learn more:
- [Community Guidelines](./documents/8-moderation.md)
- [Moderation Tools](./documents/9-mod-handbook.md)
- [Appeals Process](./documents/10-appeals.md)
</details>

<details>
<summary>How can I ensure the best streaming quality?</summary>

Follow these guidelines for optimal streaming:

1. **Stream Settings**
   - Resolution: 1080p max
   - Framerate: 60fps max
   - Bitrate: 6000kbps max
   - Keyframe: 2 seconds
   - x264 medium preset

2. **Model Optimization**
   - Reduce polygon count
   - Optimize textures
   - Minimize physics
   - Use LODs
   - Cache animations

3. **Network Setup**
   - Wired connection
   - QoS settings
   - Server selection
   - Backup connection
   - Network monitoring

4. **Hardware Usage**
   - GPU encoding
   - CPU management
   - RAM allocation
   - Storage speed
   - Temperature control

Learn more:
- [Streaming Guide](./documents/11-streaming.md)
- [Model Optimization](./documents/12-models.md)
- [Network Setup](./documents/13-network.md)
</details>