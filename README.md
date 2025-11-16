# ptschoolslinux
This is an immutable operating system for the [Port Townsend School District](https://www.ptschools.org/). It uses [blue-build](https://blue-build.org/) for the build system and [Universal Blue](https://universal-blue.org/) for the base images. Upstream of universal blue is [Fedora](https://fedoraproject.org/) a free and open source volunteer backed operating system. Furthermore the project is inspired by [EU-OS](https://eu-os.eu/)

## Intended use case
This OS intended to be deployed in an enterprise environment. AD is used for account management and [OpenVox](https://voxpupuli.org/) is used for additional configuration management.

Packages and configuration for joining and AD domain and running puppet are layered into the image.

## Available versions
There are two version of ptschoolslinux: ptschoolslinux and ptschoolslinux-kinoite, based on [gnome](https://www.gnome.org/) and [kde](https://kde.org/) respectively.



## Installation

### Rebasing from another fedora atomic OS
> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase from an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/jorussell1/ptschoolslinux:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
      rpm-ostree rebase ostree-image-signed:docker://ghcr.io/jorussell1/ptschoolslinux:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/jorussell1/ptschoolslinux
```
