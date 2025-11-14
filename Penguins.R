###############################################################################.
# Install packages etc 
# List of required packages
packages <- c("palmerpenguins", "tidyverse", "ggplot2", "MetBrewer")

# Install only those that are not yet installed
installed <- packages %in% installed.packages()
if (any(!installed)) {
  install.packages(packages[!installed])
}

# Load all packages
lapply(packages, library, character.only = TRUE)
##############################################################################.

# Create a dataframe
penguin_df <- penguins


# Create a scatter plot with linear relationship 
(penguins_lm_fig <- ggplot(penguin_df, aes(bill_length_mm, bill_depth_mm, colour = species)) +
  geom_point() +
  theme_bw ()+ 
  labs(title = "Association betwween bill length and depth in 3 species of penguins",
        x = "Bill length (mm)",
        y = "Bill depth (mm)") + 
  scale_colour_manual(values = met.brewer("Archambault", 3), name = "Species") +
  scale_fill_manual(values = met.brewer("Archambault", 3)) +
  stat_smooth(method = "lm"))

