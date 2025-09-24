// Use event delegation for friend actions
function initializeFriendsEvents() {
    console.log('Initializing friends events...');
    const friendsContainer = document.querySelector('.friends-container');
    console.log('Friends container found:', !!friendsContainer);

    if (friendsContainer) {
        friendsContainer.addEventListener('click', function(e) {
            console.log('Click detected:', e.target);
            const button = e.target.closest('[data-action]');
            if (!button) {
                console.log('No button with data-action found');
                return;
            }

            console.log('Button found:', button);
            const action = button.dataset.action;
            const friendId = parseInt(button.dataset.friendId);
            console.log('Action:', action, 'Friend ID:', friendId);

            if (action === 'start-chat') {
                startChat(friendId);
            } else if (action === 'view-profile') {
                viewProfile(friendId);
            }
        });
        console.log('Event listener attached to friends container');
    }
}

// Initialize on both DOMContentLoaded and Turbo events
document.addEventListener('DOMContentLoaded', initializeFriendsEvents);
document.addEventListener('turbo:load', initializeFriendsEvents);

// Also make functions globally available as backup
window.initializeFriendsEvents = initializeFriendsEvents;

function startChat(friendId) {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    fetch(`/chat_rooms/private/${friendId}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrfToken,
            'Accept': 'application/json'
        }
    })
      .then(response => response.json())
      .then(data => {
          if (data.redirect_url) {
              window.location.href = data.redirect_url;
          } else if (data.error) {
              alert(data.error);
          }
      })
      .catch(error => {
          console.error('Error starting chat:', error);
          alert('Failed to start chat. Please try again.');
      });
}

function viewProfile(friendId) {
    // TODO: Implement profile view
    alert('Profile view coming soon!');
}