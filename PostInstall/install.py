from pathlib import Path
from dataclasses import dataclass


laptop = "1"
desktop = "2"


@dataclass
class Link:
    root: str
    src: str
    dst: str


def sway(pc: str, links: list[Link]):
    root = Path().home().joinpath(".config/sway")
    if pc == laptop:
        src = "laptop_config"
    elif pc == desktop:
        src = "desktop_config"
    else:
        return
    dst = "pc_specific"
    links.append(Link(root, src, dst))


def main():
    pc = input(
        """Choose PC:
        1: laptop
        2: Desktop"""
    )

    links = []
    sway(pc, links)

    for link in links:
        dst = link.root.joinpath(link.dst)
        src = link.root.joinpath(link.src)
        dst.symlink_to(src)


if __name__ == "__main__":
    main()
