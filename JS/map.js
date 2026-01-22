fetch("../php/api/map.php")
.then(r => r.json())
  .then(data => {
    const box = document.getElementById("mapBox");
    box.innerHTML = `
      <iframe
        title="${data.title}"
        src="${data.embed_url}"
        width="100%" height="240"
        style="border:0; border-radius:14px;"
        loading="lazy"
        referrerpolicy="no-referrer-when-downgrade">
      </iframe>
    `;
  })
  .catch(() => {
    document.getElementById("mapBox").innerHTML = "<span>Carte indisponible</span>";
  });