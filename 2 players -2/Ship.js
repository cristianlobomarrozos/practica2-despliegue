class Ship extends Phaser.GameObjects.Sprite{
    constructor(config) {
        super(config.scene, config.x, config.y, config.key, config.anim);

        this.key= config.key;
        config.scene.physics.world.enable(this);
        config.scene.add.existing(this);        
        this.play(config.anim);                

        this.setInteractive();

        /**
         * Add the ship to the Ships group
         */
        
        config.scene.ships.add(this);
    }
    
    moveShip(speed) {
        this.y += speed;
        if (this.y > config.height) {
          this.resetShipPos(this);
        }
      }
    
    resetShipPos() {
        this.y = 0;
        var randomX = Phaser.Math.Between(0, config.width);
        this.x = randomX;
    }
    
  


}