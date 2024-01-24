var notes = Array;
var counter = 0;
var actualId = -1;
buildList();

function buildList() {
  notes = JSON.parse(localStorage.getItem("notes"));
  if (notes == null || notes == "") {
    notes = new Array();
  }
  document.getElementById("noteTitleList").innerHTML = "<div></div>";

  var ul = document.createElement("ul");
  for (var note of notes) {
    var li = document.createElement("li");
    li.innerHTML = "<li onclick='showNote(this.id)' id=" + counter +">" + note.name +"</li>";
    ul.appendChild(li);
    counter++;
  }

  document.getElementById("noteTitleList").appendChild(ul);
}

function save() {
  notes = JSON.parse(localStorage.getItem("notes"));

  if (actualId >= 0) {
    notes[actualId] = {
      name: document.getElementById("name").value,
      content: document.getElementById("content").value,
    };
    actualId = -1;
  } else {
    if (notes == null || notes == "") {
      notes = new Array();
    }
    let newNote = {
      name: document.getElementById("name").value,
      content: document.getElementById("content").value,
    };

    notes.push(newNote);
  }
  localStorage.setItem("notes", JSON.stringify(notes));
  buildList();
}

function showNote(index) {
  var title = document.getElementById("name");
  var content = document.getElementById("content");

  title.value = notes[index].name;
  content.innerText = notes[index].content;
  actualId = index;
}
