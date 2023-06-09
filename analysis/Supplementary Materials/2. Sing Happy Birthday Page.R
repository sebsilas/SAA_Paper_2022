
library(musicassessr)
library(SAA)


# Create a "Sing Happy Birthday Page"

sing_hbd <- function() {
  record_audio_page(label = "sing_hbd",
                    page_text = "Please sing happy birthday!",
                    get_answer = get_answer_simple_pyin_summary,
                    auto_next_page = TRUE)
}




# Launch the SAA with the new Happy Birthday page at the beginning of the protocol

SAA_standalone(append_trial_block_before = sing_hbd())



# Or the end

SAA_standalone(append_trial_block_after = sing_hbd())




# Or even in your own custom timeline!

password <- "demo"

timeline <- join(

  sing_hbd(),

  # Make sure results are saved to disk
  elt_save_results_to_disk(complete = TRUE),

  # A "final_page" is required at the end of a psychTestR timeline
  final_page("You have completed the study!")
)


make_test(
  elts = timeline,
  opt = test_options(title = "Melody Singing", admin_password = password))

# NB. musicassessr::sing_happy_birthday_page
# NB musicassessr::get_answer_simple_pyin_summary
