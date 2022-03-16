library(tidyverse)
namekey <- read.csv("./data/TrialNameKey.csv") %>% rename(Trial = Abbreviated.Trial.Name)

results_dir <- "./output"
pretreatment.results.files <- list.files(results_dir, pattern = "within_trial_waves_PLS_importance_", full.names = T)

pretreatment.results.df <- map_dfr(pretreatment.results.files, read_csv) %>%
  left_join(namekey) %>%
  dplyr::select(-studyName) %>%
  drop_na(Trial) %>%
  dplyr::select(Trial, everything())

plsimportance_plot_pretreatments <- pretreatment.results.df %>%
  pivot_longer(., cols = starts_with("X"), names_to = "Wavelength", values_to = "PLS.importance") %>%
  group_by(Trial, Pretreatment) %>%
  mutate(PLS.importance.scaled = scales::rescale(PLS.importance, to = 0:1)) %>%
  group_by(Trial, Pretreatment, Wavelength) %>%
  summarize(PLS.importance.mean = mean(PLS.importance.scaled)) %>%
  ggplot(aes(x = parse_number(as.character(Wavelength)),
             y = PLS.importance.mean,
             shape = Trial,
             color = Trial)) +
  labs(title = "PLS variable importance",
    subtitle = "All pretreatments",
    x = "Wavelength (nm)",
    y = "Trial mean variable importance") +
  geom_point(alpha = 0.65) +
  scale_color_manual(values = iwanthue, name = "Trial") +
  scale_shape_manual(values = 1:10, name = "Trial") +
  lims(x = c(740 ,1070)) +
  theme_bw() +
  facet_grid(rows = vars(Pretreatment))
plsimportance_plot_pretreatments

ggsave(plsimportance_plot_pretreatments, filename = "../output/Figure6_PLS_Importance_scaled_pretreatments.png",
       bg = "transparent",height=15, width=6)
