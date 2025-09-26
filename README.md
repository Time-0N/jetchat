# JetChat

A modern real-time chat application built with Ruby on Rails 8, featuring friend management, private messaging, and live presence indicators.

## 🚀 Features

- **Real-time Messaging** - Instant messaging with WebSocket connections via ActionCable
- **Friend System** - Send friend requests, manage friendships, and discover new users
- **Private Chat Rooms** - Dedicated chat spaces for each friendship
- **Live Presence** - See when friends are online/offline in real-time
- **Typing Indicators** - Live typing status updates
- **Message Read Status** - Track unread messages with notification badges
- **Responsive Design** - Works seamlessly on desktop and mobile devices
- **Toast Notifications** - Beautiful, animated user feedback system

## 🛠 Tech Stack

- **Backend**: Ruby on Rails 8.0+
- **Database**: PostgreSQL
- **Real-time**: ActionCable (WebSockets)
- **Authentication**: OAuth 2.0 with JWT tokens (Zitadel)
- **Job Processing**: SolidQueue
- **Asset Pipeline**: Propshaft
- **Styling**: CSS styling
- **Deployment**: Docker + Docker Compose

## 📋 Requirements

- Ruby 3.2+
- Rails 8.0+
- PostgreSQL 14+
- Node.js 18+ (for asset compilation)
- Docker & Docker Compose (for deployment)

## 🚦 Getting Started

### Development Setup

#### Prerequisites

> TODO: Add installation instructions for:
> - Ruby installation (rbenv/rvm)
> - PostgreSQL setup
> - Node.js installation
> - Environment variable configuration

#### Database Setup

> TODO: Add database setup steps:
> - Database creation
> - Migrations
> - Seed data (if any)

#### OAuth Configuration

> TODO: Add OAuth setup instructions:
> - Zitadel configuration
> - Environment variables for OAuth
> - JWT configuration

#### Running the Application

> TODO: Add startup instructions:
> - Bundle installation
> - Asset compilation
> - Server startup
> - WebSocket setup verification

### Production Deployment

#### Docker Deployment

> TODO: Add Docker deployment steps:
> - Environment file setup
> - Docker Compose configuration
> - SSL/HTTPS setup
> - Domain configuration

#### Environment Variables

> TODO: Document required environment variables:
> - Database configuration
> - OAuth settings
> - Action Cable settings
> - Application secrets

## 🏗 Architecture

### Models

- **User** - User accounts with OAuth authentication
- **Friendship** - Bidirectional friend relationships
- **FriendRequest** - Pending friendship requests
- **ChatRoom** - Chat room containers (private rooms for friends)
- **ChatRoomMembership** - User membership in chat rooms
- **Message** - Chat messages with read tracking

### Controllers

- **AuthController** - OAuth authentication flow
- **DashboardController** - Main dashboard view
- **FriendsController** - Friend management and discovery
- **FriendRequestsController** - Friend request handling
- **ChatRoomsController** - Chat room management
- **MessagesController** - Message creation

### WebSocket Channels

- **PresenceChannel** - Global user online/offline status
- **ChatRoomChannel** - Real-time messaging and typing indicators
- **NotificationsChannel** - Live notification updates

## 🎨 Frontend Features

### Notification System
- Beautiful toast notifications with animations
- Support for success, error, warning, and info messages
- Auto-dismissal with progress indicators
- Click-to-dismiss functionality

### Real-time Features
- Live message delivery
- Typing indicators
- Online/offline presence
- Unread message counters

### Responsive Design
- Mobile-first approach
- Touch-friendly interface
- Adaptive layouts

## 🧪 Testing

> TODO: Add testing information:
> - Test setup
> - Running tests
> - Test coverage
> - Testing WebSocket functionality

## 📝 API Documentation

> TODO: Add API documentation:
> - Authentication endpoints
> - REST API endpoints
> - WebSocket events
> - Response formats

## 🔧 Configuration

### Database Configuration

> TODO: Document database configuration options

### ActionCable Configuration

> TODO: Document WebSocket configuration

### Authentication Configuration

> TODO: Document OAuth setup details

## 🚀 Deployment

### Docker

The application includes Docker configuration for easy deployment:

```bash
# Development
docker-compose up

# Production
docker-compose -f docker-compose.prod.yml up
```

### Environment Files

- `.env.example` - Template for environment variables
- `devops/.env.prod.example` - Production environment template

## 📚 Development Guide

### Adding New Features

> TODO: Add development guidelines:
> - Code style guidelines
> - Adding new controllers
> - WebSocket channel development
> - Database migrations

### WebSocket Development

> TODO: Add WebSocket development guide:
> - Creating new channels
> - Broadcasting events
> - Frontend integration

## 🤝 Contributing

> TODO: Add contribution guidelines:
> - Code of conduct
> - Pull request process
> - Issue reporting
> - Development workflow

## 📄 License

> TODO: Add license information

## 🙋‍♂️ Support

> TODO: Add support information:
> - Issue tracker
> - Discussion forums
> - Contact information

---

*Built with ❤️ using Ruby on Rails*
