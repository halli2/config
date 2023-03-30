from pathlib import Path


def main():
    pc = input(
        """Choose PC:
        1: laptop
        2: Desktop"""
    )
    sway_config = Path().home().joinpath(".config/sway/")
    link = sway_config.joinpath("pc_specific")
    if pc == "1":
        target = sway_config.joinpath("laptop_config")
    else:
        target = sway_config.joinpath("desktop_config")

    link.symlink_to(target)


if __name__ == "__main__":
    main()
