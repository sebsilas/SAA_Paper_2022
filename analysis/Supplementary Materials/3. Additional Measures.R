

library(SAA)


log_scores <- function(onset, dur, freq, note, stimuli, stimuli_durations) {

  tibble::tibble(log_onset = log(onset),
                 log_dur = log(dur),
                 freq_2 = freq * 2,
                 stimuli_durations = log(stimuli_durations))

}

check_no_notes_above_c4 <- function(onset, dur, freq, note, stimuli, stimuli_durations) {

  # C4 is MIDI note number 60
  sum(note > 60)

}



# Example 1: additional measure using a trivial function to take the log of onset, durations and stimuli durations and multiply the frequency by 2
example_1 <- SAA::SAA_standalone(skip_setup = TRUE,
                                 app_name = 'additional_measures',
                                 num_items = list(long_tones = 2L, arrhythmic = 2L, rhythmic = 2L),
                                 examples = 0,
                                 max_goes = 1L,
                                 additional_scoring_measures = log_scores)


# Example 2: additional measure using a trivial function to check the number of notes above C4 (MIDI pitch 60)
example_2 <- SAA::SAA_standalone(skip_setup = TRUE,
                                 app_name = 'additional_measures',
                                 num_items = list(long_tones = 2L, arrhythmic = 2L, rhythmic = 2L),
                                 examples = 0,
                                 max_goes = 1L,
                                 additional_scoring_measures = check_no_notes_above_c4)


# Example 3: a list of functions
SAA::SAA_standalone(skip_setup = TRUE,
                    app_name = 'additional_measures',
                    num_items = list(long_tones = 2L, arrhythmic = 2L, rhythmic = 2L),
                    examples = 0,
                    max_goes = 1L,
                    additional_scoring_measures = list(check_no_notes_above_c4, log_scores))




