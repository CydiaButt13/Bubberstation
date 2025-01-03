/datum/movespeed_modifier/bodysize
	variable = TRUE
	flags = IGNORE_NOSLOW

/mob/living/carbon/proc/set_size(new_size)
	if(!new_size || !istype(dna))
		return FALSE

	new_size = clamp(new_size, CONFIG_GET(number/body_size_max), CONFIG_GET(number/body_size_min))
	dna.features["body_size"] = new_size
	dna.update_body_size()

	return TRUE

/// Alters the parent mob's sprite size by adding `new_value` to the current value.
/mob/living/carbon/proc/update_size_by_value(new_value)
	if(new_value == 0 || !istype(dna))
		return FALSE

	return set_size(dna.features["body_size"] + new_value)

/// Alters the parent mob's sprite size by multiplying their current size by `new_percent`.
/mob/living/carbon/proc/update_size_by_percent(new_percent)
	if(new_percent == 1 || !istype(dna))
		return FALSE

	return set_size(dna.features["body_size"] * new_percent)
