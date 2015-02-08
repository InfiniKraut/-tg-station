/*
//////////////////////////////////////

Biosuit

	Obvious
	Increases resistance
	Decreases stage speed
	Increased transmitability (skin manifestation)
	Plasma level

Bonus
	Makes the infected resistant to the cold and heat.

//////////////////////////////////////
*/

/datum/symptom/spaceskin

	name = "Biosuit"
	stealth = -2
	resistance = 1
	stage_speed = 3
	transmittable = 1
	level = 5

/datum/symptom/spaceskin/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB * 3))
		var/mob/living/M = A.affected_mob
		switch(A.stage)
			if(4, 5)
				if (M.reagents.get_reagent_amount("leporazine") < 400)
					M.reagents.add_reagent("leporazine", 600)
			else
				if(prob(SYMPTOM_ACTIVATION_PROB * 19))
					M << "<span class='notice'>[pick("You feel cozy")]</span>"
	return
