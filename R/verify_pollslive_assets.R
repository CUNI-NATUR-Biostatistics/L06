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
    "l05-odhad-se-lokality.png" =
      "fe97bd59c9aa76a5f37c5a0f2fa10532b5e66c093338c63aacebab88ef1d92f4",
    "l05-p-value-tails.png" =
      "7d0af829f0e0accb6d93121748bbdef8af4b9c717b3f6694cc9555930b43621a",
    "l05-mala-studie.png" =
      "5928a8b42ce8081fe5fc3946956ba6e0e8066c4bc2b1f4909a11ce0bf69de593"
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
