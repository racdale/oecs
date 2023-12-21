# OECS
Code for illustrations in Dale (submitted) introducing complex dynamical systems

# logistic.R

A commonly used model to illustrate core concepts of complexity and dynamics. Code runs individual simulations of the logistic map. It also reconstructs its values ($x_t$) across a range of the control parameter ($r$).

# hkb.R

Illustration of perhaps the simplest version of the Haken-Kelso-Bunz model ($\dot{\phi} = - \sin\phi - 2 k \sin 2 \phi$). This HKB models the relative phase or angle ($\phi$) between two limbs (say, fingers) as they oscillate together with different rates of movement (lower $k$ == faster movement). The code runs 10,000 simulations for a "fast movement" condition and a "slow movement" condition and plots $\phi$ in time.

# rt_fractal.R

Using data from Mahmoodi et al. (2023), a simple illustration of how thousands of reaction times have structure similar to fractal organization. The illustration is made by plotting successively "zoomed" segments of the reaction-time series.
