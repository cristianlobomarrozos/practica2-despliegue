class Scene1 extends Phaser.Scene {
  constructor() {
    super("bootGame");
  }


  preload(){

    this.cameras.main.setBackgroundColor(0x2a0503);
    this.fullBar = this.add.graphics();
    this.fullBar.fillStyle(0xda7a34, 1);
    this.fullBar.fillRect((this.cameras.main.width / 4)-2,(this.cameras.main.height /2) - 18, (this.cameras.main.width / 2) + 4, 20);
    this.progress = this.add.graphics();

    //pass loading progress as value to loading bar and redraw as files load
    this.load.on('progress', function (value) {
        this.progress.clear();
        this.progress.fillStyle(0xfff6d3, 1);
        this.progress.fillRect((this.cameras.main.width / 4), (this.cameras.main.height /2) - 16, (this.cameras.main.width / 2) * value, 16);
    }, this);

    this.load.on('complete', function () {
       this.progress.destroy();
       this.fullBar.destroy();
   }, this);




    this.load.image("background", "assets/images/background.png");
    //
    this.load.spritesheet("ship", "assets/spritesheets/ship.png",{
      frameWidth: 16,
      frameHeight: 16
    });
    this.load.spritesheet("ship2", "assets/spritesheets/ship2.png",{
      frameWidth: 32,
      frameHeight: 16
    });
    this.load.spritesheet("ship3", "assets/spritesheets/ship3.png",{
      frameWidth: 32,
      frameHeight: 32
    });
    this.load.spritesheet("explosion", "assets/spritesheets/explosion.png",{
      frameWidth: 16,
      frameHeight: 16
    });
    this.load.spritesheet("power-up", "assets/spritesheets/power-up.png",{
      frameWidth: 16,
      frameHeight: 16
    });
    this.load.spritesheet("player", "assets/spritesheets/player.png",{
      frameWidth: 16,
      frameHeight: 24
    });
    //1.1 load the spritesheet for the beam
    this.load.spritesheet("beam", "assets/spritesheets/beam.png",{
      frameWidth: 16,
      frameHeight: 16
    });

    // 1.2 load the font fies
    this.load.bitmapFont("pixelFont", "assets/font/font.png", "assets/font/font.xml");


  }

  create() {

    this.initRegistry();

    this.add.text(20, 20, "Loading game...");
    this.scene.start("mainMenu");

    this.anims.create({
      key: "ship1_anim",
      frames: this.anims.generateFrameNumbers("ship"),
      frameRate: 20,
      repeat: -1
    });
    this.anims.create({
      key: "ship2_anim",
      frames: this.anims.generateFrameNumbers("ship2"),
      frameRate: 20,
      repeat: -1
    });
    this.anims.create({
      key: "ship3_anim",
      frames: this.anims.generateFrameNumbers("ship3"),
      frameRate: 20,
      repeat: -1
    });

    this.anims.create({
      key: "explode",
      frames: this.anims.generateFrameNumbers("explosion"),
      frameRate: 20,
      repeat: 0,
      hideOnComplete: true
    });

    this.anims.create({
      key: "red",
      frames: this.anims.generateFrameNumbers("power-up", {
        start: 0,
        end: 1
      }),
      frameRate: 20,
      repeat: -1
    });
    this.anims.create({
      key: "gray",
      frames: this.anims.generateFrameNumbers("power-up", {
        start: 2,
        end: 3
      }),
      frameRate: 20,
      repeat: -1
    });
    this.anims.create({
      key: "thrust",
      frames: this.anims.generateFrameNumbers("player"),
      frameRate: 20,
      repeat: -1
    });

    // 1.2 animation for the beam
    this.anims.create({
      key: "beam_anim",
      frames: this.anims.generateFrameNumbers("beam"),
      frameRate: 20,
      repeat: -1
    });
  }

  initRegistry()
  {
    //the game registry provides a place accessible by all scenes to set and get data.
    //Here we store our key that tells the LevelScene what map to load.
    this.registry.set('score1', 0);
    this.registry.set('score2', 0);
    this.registry.set('lives1', 3);
    this.registry.set('lives2', 3);

}
}
