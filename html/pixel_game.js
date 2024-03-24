const content = document.querySelector(".lista_jogos");
const inputSearch = document.querySelector("input[type='search']");


//lista de jogos:
let items = [
  "The witcher 3",
  "Starfield",
  "Terraria",
  "Grand Theft Auto V",
  "Dark Souls 3",
  "Horizon Forbidden west",
  "Dishonored 2",
  "NBA 2K23",
  "God Of War: Ragnarok",
  "Destiny 2",
  "Life is Strange: Remastered",
];

inputSearch.oninput = () => {
  content.innerHTML = "";

  items
    .filter((item) =>
      item.toLowerCase().includes(inputSearch.value.toLowerCase())
    )
    .forEach((item) => addHTML(item));
};

function addHTML(item) {
  const div = document.createElement("div");
  div.innerHTML = item;
  content.append(div);
}