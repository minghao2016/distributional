autoplot.distribution <- function(x, type = c("pdf", "cdf"), n = 100,
                                  quantile_range = c(0.001, 0.999), ...){
  type <- match.arg(type)
  lower <- quantile(x, quantile_range[1])
  upper <- quantile(x, quantile_range[2])
  x_pos <- mapply(function(l, u) seq(l, u, length.out = n), l = lower, u = upper, SIMPLIFY = FALSE)
  if(type == "pdf"){
    y_val <- mapply(
      function(d, x){
        vapply(x, function(at) density(d, at), numeric(1L))
      }, d = x, x = x_pos, SIMPLIFY = FALSE)
  }
  else if(type == "cdf"){
    y_val <- mapply(
      function(d, x){
        vapply(x, function(q) cdf(d, q), numeric(1L))
      }, d = x, x = x_pos, SIMPLIFY = FALSE)
  }
  x_pos <- do.call("vec_c", x_pos)
  y_val <- do.call("vec_c", y_val)

  ggplot2::ggplot(
    data.frame(x = x_pos, y = y_val, dist = rep(seq_along(x), each = n)),
    ggplot2::aes_string(x = "x", y = "y", group = "dist")
  ) +
    ggplot2::geom_line() +
    ggplot2::labs(y = type)
}