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

> - Ruby installation (rbenv/rvm)
> - PostgreSQL setup
> - Node.js installation
> - Environment variable configuration
> - Run ```docker compose up -d``` in ``/devops``

#### Database Setup

> - Database creation. Either via. the dev Webview or manuel in psql ```CREATE DATABASE modul_223db;```
> - Migrations via ```rails db:migrate``` or through the dev webview

#### OAuth Configuration

> - Zitadel configuration under: ```http://localhost:8080/ui/console?login_hint=zitadel-admin@zitadel.localhost```
> - Default Password for the zitadel admin is: ```Password1!```
> - Under ```Project``` create a new project
> - In the Project create a new application.
> - Select ```SPA``` and give it a name. 
> - For the authentication method select: ```PKCE```
> - For the redirect URLs define: ```http://localhost:{SERVER_PORT}/auth/callback```
> - For the post logout URL define: ```http://localhost:5000/```
> - Lastly enable development mode, to allow http
> - Then create the application and copy the client id. Add it to your local .env file
> - Also define the URL of the ISSUER, in this case this would be: ```http://localhost:8080```
> - In your application enable refresh token.
> - In your application go to ```Token Settings``` and switch to ``JWT``. Then active ``User Info inside ID Token``
> - Next go to ```Default Settings```
> - Here go to ```Password Complexity``` and configure it as desired
> - If you wish to enable user registration: go to ```Login Behavior and Security``` and select ```User Registration allowed```. You also need to define the user policies. This can be done under ```External Links```. Here you need to define: ```Link to Terms of Service``` and ```Link to Privacy Policy```. Just use: ```https://example.com/terms``` and ```https://example.com/privacy``` for dev

#### Running the Application

> - Bundle installation
> - Then just run ```rails s```

### Production Deployment

> - Instructions coming soon: See devops .env.prod.example 

#### Docker Deployment

> - See devops .env.prod.example for environment
> - Dockerhub image: https://hub.docker.com/r/masterbaiter/jetchat-ruby_on_rails

#### Environment Variables

> - See .env.example

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
