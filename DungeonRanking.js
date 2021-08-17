const dungeons = [
  ["Crumbling Mine", 45],
  ["Gate of the Dead", 50],
  ["Ruined Cemetery", 50],
  ["Small Cave", 70],
  ["Ancient Forest", 120],
  ["Catacomb", 120],
  ["Stairs of Trial", 130],
  ["Delusion Forest", 180],
  ["House of Darkness", 210],
  ["Permafrost", 600],
  ["Fog Castle", 720],
  ["Bloodrust Mansion", 1200],
  ["Sol City", 1200],
  ["Firetop Mountain", 1500],
];

function get_selectedDungeon() {
  let selection = document.getElementById('selected_dungeon');
  selectedDungeon = selection.options[selection.selectedIndex].value;
  return selectedDungeon;
}

function get_dungeonBaseScore() {
  dungeonIndex = dungeons.findIndex(dungeon => dungeon[0] == selectedDungeon)
  baseScore = dungeons[dungeonIndex][1];
  return baseScore;
}

function get_dungeonScore() {
  let time = document.getElementById('dungeonTime').value;
  let found = document.getElementById('dungeonFound').value;
  let continues = document.getElementById('dungeonContinues').value;
  let charged = document.getElementById('dungeonCharged').value;

  let score = 1000 + baseScore - time;
  if (score > 1000) {
    score = 1000;
  }
  dungeonScore = score - (found * 30) - (continues * 100) + (charged * 10);
  document.getElementById('dungeonScore').value = dungeonScore;
  return dungeonScore;
}

function get_dungeonRank() {
  if (dungeonScore < 100) {rank = "C-"}
  else if (dungeonScore < 300) {rank = "C"}
  else if (dungeonScore < 500) {rank = "C+"}
  else if (dungeonScore < 600) {rank = "B-"}
  else if (dungeonScore < 700) {rank = "B"}
  else if (dungeonScore < 800) {rank = "B+"}
  else if (dungeonScore < 900) {rank = "A-"}
  else if (dungeonScore < 950) {rank = "A"}
  else if (dungeonScore < 1000) {rank = "A+"}
  else {rank = "S"}
  document.getElementById('dungeonRank').value = rank;
  return rank;
}
