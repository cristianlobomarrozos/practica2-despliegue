class GameOver extends Phaser.Scene {
    constructor() {
      super("gameOver");     
    }

    create(){        
        const menuButton = this.add.bitmapText(config.width / 2 - 75, config.height / 2, "pixelFont", "GAMEOVER " , 40); 

        menuButton.setInteractive().on('pointerdown', () => { 
            this.time.addEvent({
                delay: 500,
                callback: () => {
                    this.cameras.main.fade(700, 0, 0, 0);
                    this.cameras.main.once('camerafadeoutcomplete', () => {
                        this.scene.start('mainMenu');
                    });
                }
            });
        });
    }

    changeScene() {
        
        this.scene.start("mainMenu");
    }
}