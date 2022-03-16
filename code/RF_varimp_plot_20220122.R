
rfimportance <- read.csv("./output/within_trial_waves_RF_importance_20220122.csv") %>%
  left_join(namekey) %>%
  dplyr::select(-studyName) %>%
  rename(studyName = Trial) %>%
  drop_na(studyName) %>%
  dplyr::select(studyName, everything())

rfimportance_plot_points <- rfimportance %>%
  pivot_longer(., cols = starts_with("X"), names_to = "Wavelength", values_to = "rf.importance") %>%
  group_by(studyName) %>%
  mutate(rf.importance.scaled = scales::rescale(rf.importance, to = 0:1)) %>%
  group_by(studyName, Wavelength) %>%
  summarize(rf.importance.mean = mean(rf.importance.scaled)) %>%
  ggplot(aes(x = parse_number(as.character(Wavelength)),
             y = rf.importance.mean,
             shape = studyName,
             color = studyName)) +
  labs(#title = "Random forest variable importance",
    #subtitle = "Trial mean of 10 iterations of model development",
    x = "Wavelength (nm)",
    y = "Trial mean variable importance") +
  geom_point(alpha = 0.65) +
  scale_color_manual(values = iwanthue, name = "Trial") +
  scale_shape_manual(values = 1:10, name = "Trial") +
  lims(x = c(740 ,1070)) +
  theme_bw()
rfimportance_plot_points

ggsave(rfimportance_plot_points, filename = "./output/Figure6_RF_Importance_scaled_20220122.png",
       bg = "transparent",height=5, width=7)
