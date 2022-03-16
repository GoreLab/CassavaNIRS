sum()

temp <- plots.aggregated %>%
  pretreat_spectra(pretreatment = 1) %>%
  mutate(dmc.percentile = percent_rank(dry.matter.content.percentage.CO_334.0000092),
         dmc.extreme = case_when(
           dmc.percentile > 0.95 ~ "Top 5%",
           dmc.percentile < 0.05 ~ "Bottom 5%",
           TRUE ~ NA_character_
         ),
         .after = 21) %>%
  filter(!is.na(dmc.extreme)) %>%
  # mutate(unique.id = paste(studyName,plotNumber)) %>%
  # dplyr::select(unique.id, starts_with("X")) %>%
  # waves::plot_spectra(df = .,num.col.before.spectra = 1,detect.outliers = F)
  dplyr::select(dmc.extreme, tidyselect::starts_with("X")) %>%
  group_by(dmc.extreme) %>%
  summarize_all(mean) %>%
  ungroup() %>%
  tidyr::gather(key = "wl", value = "s.value", tidyselect::starts_with("X")) %>%
  dplyr::mutate(wl = as.numeric(stringr::str_extract(.data$wl, "\\-*\\d+\\.*\\d*"))) %>%
  ggplot2::ggplot(data = ., aes(x = .data$wl, y = .data$s.value,
                                #group = .data$observationUnitName,
                                color = .data$dmc.extreme)) +
  geom_line(alpha = 1) +
  #scale_color_manual(values = color, name = "Outlier?") +
  theme_minimal() +
  labs(
    title = "Top and bottom 5% RDMC",
    subtitle = "Raw data",
    x = "Wavelength",
    y = "Spectral Value"
  )
temp


mean.spectrum.plot <- plots.aggregated %>%
  pretreat_spectra(pretreatment = 1) %>%
  dplyr::select(observationUnitName, studyName, dry.matter.content.percentage.CO_334.0000092,
                tidyselect::starts_with("X")) %>%
  tidyr::gather(key = "wl", value = "s.value", tidyselect::starts_with("X")) %>%
  dplyr::mutate(wl = as.numeric(stringr::str_extract(.data$wl, "\\-*\\d+\\.*\\d*"))) %>%
  ggplot2::ggplot(data = ., aes(x = .data$wl, y = .data$s.value,
                                group = .data$observationUnitName,
                                color = .data$dry.matter.content.percentage.CO_334.0000092)) +
  geom_line(alpha = 1) +
  #scale_color_manual(values = color, name = "Outlier?") +
  theme_bw() +
  labs(
    title = "Plot mean spectra",
    subtitle = "Raw data",
    x = "Wavelength",
    y = "Spectral Value"
  ) + facet_wrap(~studyName)
mean.spectrum.plot
