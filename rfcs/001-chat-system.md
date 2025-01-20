---
title: Chat System Implementation
layout: default
---

# RFC-001: Real-time Chat System Implementation

## Summary
This RFC proposes the implementation of a scalable real-time chat system for VTubersTV, providing interactive communication capabilities with support for moderation, emotes, and special features like SuperChat equivalents.

## Basic Information
- **Author(s):** chocoOnEstrogen
- **Date Created:** 2024-01-25
- **Status:** DRAFT
- **Target Version:** v1.0.0
- **Related Issues:** **NONE**

## Motivation
A robust chat system is crucial for viewer engagement and community interaction on VTubersTV. We need a system that can:
- Handle high-volume real-time messages
- Support rich content (emotes, badges, etc.)
- Provide effective moderation tools
- Scale with platform growth
- Enable monetization features

## Detailed Design

### Architecture Components

1. WebSocket Server
   - Handles real-time message delivery
   - Manages connection states
   - Implements rate limiting
   - Authenticates users

2. Chat Service
   - Processes messages
   - Handles commands
   - Enforces moderation rules
   - Manages user states

3. Storage Layer
   - Stores message history
   - Maintains user settings
   - Keeps channel configurations
   - Logs moderation actions

### Message Format
```typescript
interface ChatMessage {
  id: string;
  type: 'chat' | 'system' | 'moderation' | 'highlight';
  content: {
    text: string;
    emotes?: EmotePosition[];
    mentions?: UserMention[];
    command?: ChatCommand;
  };
  sender: {
    id: string;
    username: string;
    badges: Badge[];
    roles: string[];
  };
  channel: string;
  timestamp: number;
  metadata?: {
    highlight?: {
      amount?: number;
      currency?: string;
      duration?: number;
    };
    moderation?: {
      action?: string;
      reason?: string;
      duration?: number;
    };
  };
}
```

### Implementation Details

#### Rate Limiting
- Per-user message limits: 1 message per second
- Channel-wide slow mode: Configurable 3-120 seconds
- Follower-only mode: Minimum follow time requirement
- Subscriber privileges: Higher rate limits

#### Moderation Features
- Automated filtering
- Manual moderation actions
- Timeout and ban functionality
- Audit logging
- Appeals system

### Examples

1. Regular Chat Message:
```json
{
  "id": "msg_123",
  "type": "chat",
  "content": {
    "text": "Hello everyone! 👋",
    "emotes": []
  },
  "sender": {
    "id": "user_456",
    "username": "ChatUser",
    "badges": ["subscriber"],
    "roles": ["user"]
  },
  "channel": "streamer_789",
  "timestamp": 1706198400000
}
```

2. Highlighted Message:
```json
{
  "id": "msg_124",
  "type": "highlight",
  "content": {
    "text": "Great stream today!"
  },
  "sender": {
    "id": "user_457",
    "username": "Supporter",
    "badges": ["subscriber", "supporter"],
    "roles": ["user"]
  },
  "channel": "streamer_789",
  "timestamp": 1706198410000,
  "metadata": {
    "highlight": {
      "amount": 500,
      "currency": "JPY",
      "duration": 30
    }
  }
}
```

## Migration Path
As this is a new system, no migration is needed. However, we should:
1. Beta test with selected channels
2. Gradually roll out to all users
3. Monitor performance and gather feedback
4. Iterate based on user experience

## Drawbacks
1. Complex infrastructure requirements
2. Potential scalability challenges
3. Moderation overhead
4. Storage costs for message history

## Alternatives

### Alternative 1: Third-party Chat Solution
- Description: Use existing chat platforms (e.g., Discord)
- Pros: 
  - Faster implementation
  - Proven reliability
- Cons:
  - Limited customization
  - Platform dependency
  - Revenue sharing
- Why rejected: Need full control over features and user experience

### Alternative 2: Federation Protocol
- Description: Implement ActivityPub for chat
- Pros:
  - Interoperability
  - Distributed load
- Cons:
  - Complex implementation
  - Limited real-time capabilities
- Why rejected: Real-time requirements not met

## Unresolved Questions
1. Message retention policy
2. Cross-channel chat features
3. Integration with clipping features
4. Offline message handling

## Impact

### On Users
- Improved interaction capabilities
- Better moderation experience
- New monetization options
- Enhanced community features

### On Documentation
- API documentation updates
- User guides for features
- Moderation guidelines
- Integration documentation

### On Testing
- Real-time message delivery tests
- Load testing requirements
- Moderation tool testing
- Client compatibility testing

## Feedback Needed
1. Rate limiting thresholds
2. Moderation feature set
3. Message format extensibility
4. Storage duration requirements

## Implementation Checklist
- [ ] Design review
- [ ] Community feedback gathered
- [ ] Documentation written
- [ ] Tests written
- [ ] WebSocket server implemented
- [ ] Chat service implemented
- [ ] Storage layer implemented
- [ ] Client libraries created
- [ ] Beta testing completed
- [ ] Production deployment 