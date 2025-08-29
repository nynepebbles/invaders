# Curses Invaders 👾

<p align="center">
  <img src="https://github.com/nynepebbles/invaders/blob/main/etc/invaders.png?raw=true" />
</p>

**Curses Invaders** is a clone of the classic arcade game *Space Invaders*, built to run in a command-line terminal. It is written in C++ and utilizes the `ncurses` library for rendering and input. The game recreates the original's core mechanics, featuring a player-controlled ship, descending waves of alien enemies, and projectile-based combat, with all graphics rendered using ASCII art.

---

## How to Play

Controls are intuitive and designed for quick, responsive gameplay:

* **Move Left**: `j`
* **Move Right**: `;`
* **Shoot**: `Spacebar`
* **Quit Game**: `q`

---

## Installation & Launch

To get **Curses Invaders** running, you'll need a C++17 compatible compiler, the `ncurses` library, and `xmake` for building.

### 1. Clone the Repository

    git clone https://github.com/nynepebbles/invaders
    cd invaders

### 2. Set the Sprite Path

The game relies on an environment variable to locate its sprite files. Run this command from the project's root:

    export INVADERS_SPRITE_PATH=$(pwd)/sprites

### 3. Build and Run

Use `xmake` to compile and launch the game:

    xmake run

(If you use **Nix**, simply run `nix-shell` first to set up your environment automatically.)

---

## Project Structure

For those curious about the implementation, key components include:

* **`Program`**: Manages the main game loop, state, rendering, and input.
* **`Entity`**: A base class for all in-game objects (ship, aliens, bullets) with position, velocity, and health.
* **`Sprite`**: Handles loading and rendering of ASCII art.
* **`CollisionBuffer`**: A grid-based system for detecting in-game collisions.
