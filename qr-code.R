library(qrcode)
qr <- qr_code("https://hans-mtz.github.io/SPA_Worship_WP/")
plot(qr)

generate_svg(
    qr,
    "spa_wp_form.svg",
    size = 900
)
