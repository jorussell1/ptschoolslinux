export repo_base := 'ghcr.io/jorussell1'
alias kde-iso := generate-kde-iso
alias gnome-iso := generate-gnome-iso

default:
    just --list

[doc("Build the oci image for the gnome based variant")]
build-gnome:
    bluebuild build recipes/recipe-gnome.yml

[doc("Build the oci image for the kde based variant")]
build-kde:
    bluebuild build recipes/recipe-kde.yml

[doc("Generate iso image base off an image see bluebuild generate-iso for image path spec")]
generate-iso name image:
    bluebuild generate-iso --verbose --tempdir ./ -V kinoite --iso-name {{name}}-$(date +"%y%m%d").iso image {{ image }}
    
[doc("Generate the installation media with KDE")]
generate-kde-iso:
    just generate-iso ptschools-kde ${repo_base}/ptschoolslinux-kinoite:latest

[doc("Generate installation media with Gnome")]
generate-gnome-iso:
    just generate-iso ptschools-gnome ${repo_base}/ptschoolslinux:latest
