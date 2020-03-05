class MainMenu extends Phaser.Scene {
    constructor() {
      super("mainMenu");
    }

    create(){
        this.background = this.add.tileSprite(0, 0, config.width, config.height, "background").setOrigin(0, 0);
        const startButton = this.add.bitmapText(config.width / 2 - 75, config.height / 2, "pixelFont", "Start Game " , 40);

        const onePlayer = this.add.bitmapText(config.width / 2 - 125, config.height / 2 + 50, "pixelFont", "1 Player", 40);
        const twoPlayers = this.add.bitmapText(config.width / 2 , config.height / 2 + 50, "pixelFont", "2 Players", 40);

        onePlayer.setInteractive().on('pointerdown', () => {
            onePlayer.setTint(0xFF0000);
            this.time.addEvent({
                delay: 500,
                callback: () => {
                    this.cameras.main.fade(700, 0, 0, 0);
                    this.cameras.main.once('camerafadeoutcomplete', () => {
                        this.scene.start('playGame');
                        
                    });
                }
            });
            this.registry.set("numPlayers", 1)
        });

        twoPlayers.setInteractive().on('pointerdown', () => {
            twoPlayers.setTint(0xFF0000);
            this.time.addEvent({
                delay: 500,
                callback: () => {
                    this.cameras.main.fade(700, 0, 0, 0);
                    this.cameras.main.once('camerafadeoutcomplete', () => {
                        this.scene.start('playGame');
                    });
                }
            });
            this.registry.set("numPlayers", 2)
        });
    }

    changeScene() {

        this.scene.start("playGame");
    }
}
