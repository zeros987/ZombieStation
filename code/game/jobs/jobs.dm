
var/const/COMMAND			=(1<<0)

var/const/COMMANDER			=(1<<0)
var/const/LOGISTICS			=(1<<1)
var/const/CYBORG			=(1<<2)
var/const/MILITARYPOLICE	=(1<<3)


/*var/const/MEDSCI			=(1<<1)

var/const/RD				=(1<<0)
var/const/SCIENTIST			=(1<<1)
var/const/CHEMIST			=(1<<2)
var/const/CMO				=(1<<3)
var/const/DOCTOR			=(1<<4)
var/const/GENETICIST		=(1<<5)
var/const/VIROLOGIST		=(1<<6)
var/const/PSYCHIATRIST		=(1<<7)
var/const/ROBOTICIST		=(1<<8)
var/const/XENOBIOLOGIST		=(1<<9)*/


var/const/CIVILIAN			=(1<<2)

var/const/MARINE			=(1<<0)


var/list/assistant_occupations = list(
)


var/list/command_positions = list(
	"Commander",
	"Logistics Officer",
	"Military Police"
)


var/list/engineering_positions = list(
)


var/list/medical_positions = list(

)


var/list/science_positions = list(
)

//BS12 EDIT
var/list/civilian_positions = list(
	"Marine"
)


var/list/security_positions = list(
)


var/list/nonhuman_positions = list(
	"Cyborg"
)


/proc/guest_jobbans(var/job)
	return ((job in nonhuman_positions))

/proc/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(!job)	continue
		occupations += job

	return occupations

/proc/get_alternate_titles(var/job)
	var/list/jobs = get_job_datums()
	var/list/titles = list()

	for(var/datum/job/J in jobs)
		if(!J)	continue
		if(J.title == job)
			titles = J.alt_titles

	return titles

