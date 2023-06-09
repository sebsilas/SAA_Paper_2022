library(psychTestR)
library(SAA)
library(PDT)
library(piat)
library(mdt)
library(mpt)
library(JAJ)
library(psyquest)


password <- "demo"


timeline <- join(

  SAA(),
  # The SAA num_items defaults are the same as used in the experiment: 6 long notes, 10 arrhythmic and 10 rhythmic melodies
  # By default, the SAA deploys the Goldsmiths Musical Sophistication Index Musical Training and Singing Abilities subscales

   # The code to do this manually (commented out) is:
  # GMS(admin_password = password, subscales = c("Musical Training", "Singing Abilities")),

  # Pitch Discrimination Task
  PDT(label = "PDCT", num_items = 15L),

  # Pitch Imagery Arrow Task
  piat(label = "PIAT", num_items = 15L),

  # Melodic Discrimination Test
  mdt(label = "MDT", num_items = 11L),

  # Mistuning Perception Test
  mpt(label = "MPT", num_items = 15L),

  # Jack and Jill Working Memory Test
  JAJ(label = "JAJ", num_items = 8L),

  # Make sure results are saved to disk
  elt_save_results_to_disk(complete = TRUE),

  # A "final_page" is required at the end of a psychTestR timeline
  final_page("You have completed the study!")
)


make_test(
  elts = timeline,
  opt = test_options(title = "Melody Singing", admin_password = password))
