const content = document.querySelector(".lista_jogos");
const inputSearch = document.querySelector("input[type='search']");

// Lista de jogos:
let items = [
  "The Witcher 3",
  "Starfield",
  "Terraria",
  "Grand Theft Auto V",
  "Dark Souls 3",
  "Horizon Forbidden West",
  "Dishonored 2",
  "NBA 2K23",
  "God of War: Ragnarok",
  "Destiny 2",
  "Life is Strange: Remastered",
];

inputSearch.oninput = () => {
  content.innerHTML = "";

  if (inputSearch.value.trim() !== "") {
    //se o campo de pesquisa não estiver vazio, filtrar e mostrar sugestões
    items
      .filter((item) =>
        item.toLowerCase().includes(inputSearch.value.toLowerCase())
      )
      .forEach((item) => addHTML(item));
  }
};

function addHTML(item) {
  const div = document.createElement("div");
  div.innerHTML = item;
  content.append(div);
}