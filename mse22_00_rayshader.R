install.packages("rayshader")

library(rayshader)
localtif <- readRDS(url("http://dwoll.de/rayshader_localtif.rds"))
elmat    <- raster_to_matrix(localtif)

elmat %>%
    sphere_shade(texture="desert") %>%
    add_water(detect_water(elmat), color="desert") %>%
    add_shadow(ray_shade(elmat, zscale=3), 0.5) %>%
    add_shadow(ambient_shade(elmat), 0) %>%
    plot_3d(elmat, zscale=10, fov=0, theta=135, zoom=0.75,
            phi=45, windowsize=c(1000, 800))
