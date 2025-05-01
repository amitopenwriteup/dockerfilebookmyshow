document.addEventListener("DOMContentLoaded", () => {
  const events = [
    {
      title: "Coldplay Concert",
      date: "2025-01-20",
      location: "Mumbai, India",
    },
    {
      title: "Comedy Night",
      date: "2025-01-25",
      location: "Delhi, India",
    },
    {
      title: "Art Exhibition",
      date: "2025-02-10",
      location: "Bangalore, India",
    },
  ];

  const eventList = document.querySelector(".event-list");

  events.forEach(event => {
    const eventCard = document.createElement("div");
    eventCard.classList.add("event-card");
    eventCard.innerHTML = `
      <h3>${event.title}</h3>
      <p>Date: ${event.date}</p>
      <p>Location: ${event.location}</p>
      <button onclick="bookTicket('${event.title}')">Book Now</button>
    `;
    eventList.appendChild(eventCard);
  });
});

function bookTicket(eventTitle) {
  alert(`You have booked a ticket for ${eventTitle}!`);
}
