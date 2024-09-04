extends Label

var waktu : float = 0
var ubah : String
var index 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	waktu += delta
	
	perbaruiWaktu()

func perbaruiWaktu():
	ubah = str(waktu)
	index = ubah.find(".")
	
	if index > 0:
		ubah = ubah.left(index + 3)
	
#	Global.speedRunTime = ubah
	self.text = ubah

