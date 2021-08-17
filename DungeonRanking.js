var timeMinutes = 0;
var timeSeconds = 0;
var time = timeMinutes * 60 + timeSeconds;
var found = 0;
var continues = 0;
var charged = 0;

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

function findDungeonBaseScore() {
  dungeonIndex = dungeons.map(x => x[0]).indexOf("Ruined Cemetery");
  baseScore = dungeons[dungeonIndex][1];
  return baseScore;
}

function calc_dungeonRank(dungeonScore) {
  var dungeonScore = document.getElementById('dungeonScore').value;
  if (dungeonScore >= 1000) {
    rank = "S";
  }
  else if (dungeonScore <= 999 && dungeonScore >= 950) {
    rank = "A+";
  }
  else if (dungeonScore <= 949 && dungeonScore >= 900) {
    rank = "A";
  }
  else if (dungeonScore <= 899 && dungeonScore >= 800) {
    rank = "A-";
  }
  else if (dungeonScore <= 799 && dungeonScore >= 700) {
    rank = "B+";
  }
  else if (dungeonScore <= 699 && dungeonScore >= 600) {
    rank = "B";
  }
  else if (dungeonScore <= 599 && dungeonScore >= 500) {
    rank = "B-";
  }
  else if (dungeonScore <= 499 && dungeonScore >= 300) {
    rank = "C+";
  }
  else if (dungeonScore <= 299 && dungeonScore >= 100) {
    rank = "C";
  }
  else if (dungeonScore <= 99 && dungeonScore >= 0) {
    rank = "C-";
  }
  else {
    rank = "invalid score";
  }

  return document.getElementById('dungeonRank').value = rank;
}
