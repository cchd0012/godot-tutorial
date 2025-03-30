extends Node

var score = 0
var coins = 0

@onready var score_label: Label = $UI/ScoreLabel
@onready var end: Label = $Labels/End

func add_point():
	score += 100
	coins += 1
	score_label.text = "score: " + str(score)
	end.text = "Yon won!\nCoins: " + str(coins)
