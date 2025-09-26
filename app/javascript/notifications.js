// Notification System for JetChat
class NotificationSystem {
    constructor() {
        this.container = document.getElementById('notification-container');
        this.notifications = new Map();
        this.maxNotifications = 5;
        this.defaultDuration = 4000; // 4 seconds

        // Ensure container exists
        if (!this.container) {
            this.createContainer();
        }
    }

    createContainer() {
        this.container = document.createElement('div');
        this.container.id = 'notification-container';

        // If document.body is available, append immediately
        if (document.body) {
            document.body.appendChild(this.container);
        } else {
            // Otherwise, wait for DOM to be ready
            const appendContainer = () => {
                if (document.body) {
                    document.body.appendChild(this.container);
                } else {
                    setTimeout(appendContainer, 10);
                }
            };
            appendContainer();
        }
    }

    // Main method to show notifications
    show(message, type = 'info', options = {}) {
        const config = {
            title: options.title || this.getDefaultTitle(type),
            message: message,
            type: type,
            duration: options.duration || this.defaultDuration,
            closable: options.closable !== false,
            id: options.id || this.generateId()
        };

        // Remove existing notification with same ID
        if (this.notifications.has(config.id)) {
            this.hide(config.id);
        }

        // Remove oldest notification if at max capacity
        if (this.notifications.size >= this.maxNotifications) {
            const oldestId = this.notifications.keys().next().value;
            this.hide(oldestId);
        }

        const notification = this.createElement(config);
        this.container.appendChild(notification);
        this.notifications.set(config.id, notification);

        // Show animation
        requestAnimationFrame(() => {
            notification.classList.add('show');
        });

        // Auto-hide after duration
        if (config.duration > 0) {
            setTimeout(() => {
                this.hide(config.id);
            }, config.duration);
        }

        return config.id;
    }

    // Convenience methods
    success(message, options = {}) {
        return this.show(message, 'success', options);
    }

    error(message, options = {}) {
        return this.show(message, 'error', { duration: 6000, ...options });
    }

    warning(message, options = {}) {
        return this.show(message, 'warning', { duration: 5000, ...options });
    }

    info(message, options = {}) {
        return this.show(message, 'info', options);
    }

    // Hide notification
    hide(id) {
        if (!this.notifications.has(id)) return;

        const notification = this.notifications.get(id);
        notification.classList.remove('show');
        notification.classList.add('hide');

        setTimeout(() => {
            if (notification.parentNode) {
                notification.parentNode.removeChild(notification);
            }
            this.notifications.delete(id);
        }, 300);
    }

    // Clear all notifications
    clear() {
        this.notifications.forEach((notification, id) => {
            this.hide(id);
        });
    }

    // Create notification element
    createElement(config) {
        const notification = document.createElement('div');
        notification.className = `notification ${config.type}`;
        notification.style.setProperty('--duration', `${config.duration}ms`);

        const content = `
            <div class="notification-content">
                <div class="notification-icon"></div>
                <div class="notification-message">
                    <div class="notification-title">${this.escapeHtml(config.title)}</div>
                    <div class="notification-text">${this.escapeHtml(config.message)}</div>
                </div>
            </div>
            ${config.closable ? '<button class="notification-close" aria-label="Close">&times;</button>' : ''}
        `;

        notification.innerHTML = content;

        // Add event listeners
        if (config.closable) {
            const closeBtn = notification.querySelector('.notification-close');
            closeBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                this.hide(config.id);
            });
        }

        // Click to dismiss
        notification.addEventListener('click', () => {
            this.hide(config.id);
        });

        return notification;
    }

    getDefaultTitle(type) {
        const titles = {
            success: 'Success!',
            error: 'Error',
            warning: 'Warning',
            info: 'Info'
        };
        return titles[type] || 'Notification';
    }

    generateId() {
        return `notification-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
    }

    escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }
}

// Initialize immediately (don't wait for DOM)
window.notifications = new NotificationSystem();

// Helper functions for easy access - available immediately
window.showNotification = (message, type, options) => {
    if (!window.notifications) {
        window.notifications = new NotificationSystem();
    }
    return window.notifications.show(message, type, options);
};

window.showSuccess = (message, options) => {
    if (!window.notifications) {
        window.notifications = new NotificationSystem();
    }
    return window.notifications.success(message, options);
};

window.showError = (message, options) => {
    if (!window.notifications) {
        window.notifications = new NotificationSystem();
    }
    return window.notifications.error(message, options);
};

window.showWarning = (message, options) => {
    if (!window.notifications) {
        window.notifications = new NotificationSystem();
    }
    return window.notifications.warning(message, options);
};

window.showInfo = (message, options) => {
    if (!window.notifications) {
        window.notifications = new NotificationSystem();
    }
    return window.notifications.info(message, options);
};

// Handle DOM ready tasks
document.addEventListener('DOMContentLoaded', function() {
    // Re-initialize notification system if needed
    if (!window.notifications) {
        window.notifications = new NotificationSystem();
    }

    // Handle Rails flash messages
    const flashMessages = document.querySelectorAll('[data-flash-message]');
    flashMessages.forEach(flash => {
        const message = flash.textContent.trim();
        const type = flash.dataset.flashType || 'info';

        if (message) {
            window.notifications.show(message, type);
        }

        // Remove the flash element
        flash.remove();
    });
});

export default NotificationSystem;