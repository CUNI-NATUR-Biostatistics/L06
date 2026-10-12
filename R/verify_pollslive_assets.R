#----------------------------------------------------------#
# Verify approved local evidence for the L06 retrieval quiz
#----------------------------------------------------------#

library(here)

here::i_am("R/verify_pollslive_assets.R")

# These images are reviewed teaching inputs. Re-rendering them can change their
# bytes across R sessions and therefore makes immutable synchronization
# unreliable. R/render_pollslive_assets.R stays as their reproducible source;
# local PollsLive preparation verifies the approved bytes instead.
approved_assets <-
  c(
    "l05-p-value-tails.png" =
      "7d0af829f0e0accb6d93121748bbdef8af4b9c717b3f6694cc9555930b43621a",
    "l05-type-i-error.jpg" =
      "c4473f17924c95d164c13d1c82f374540a74cccb1fc6b0eaa00ad1e127260228",
    "l05-effect-first-conclusion.png" =
      "09baa768bfa852a78c694d732b782bd8e547c2528b10c2bef0e903c3c326180b"
  )

asset_paths <-
  here::here("pollslive", "assets", names(approved_assets))

missing_assets <-
  names(approved_assets)[!file.exists(asset_paths)]

if (length(missing_assets) > 0L) {
  stop(
    "Missing approved PollsLive evidence assets: ",
    paste(missing_assets, collapse = ", ")
  )
}

actual_checksums <-
  unname(
    vapply(
      asset_paths,
      digest::digest,
      character(1),
      algo = "sha256",
      file = TRUE
    )
  )

changed_assets <-
  names(approved_assets)[actual_checksums != unname(approved_assets)]

if (length(changed_assets) > 0L) {
  stop(
    "Approved PollsLive evidence assets changed: ",
    paste(changed_assets, collapse = ", ")
  )
}
