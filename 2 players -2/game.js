var gameSettings = {
  playerSpeed: 200,
  maxPowerups: 2,
  powerUpVel: 50,
}

var config = {
  width: 256,
  height: 272,
  backgroundColor: 0x000000,
  scene: [Scene1, MainMenu, Scene2, HUD, GameOver],
  pixelArt: true,
  physics: {
    default: "arcade",
    arcade:{
        debug: true
    }
  }
}


var game = new Phaser.Game(config);
