class Player extends Phaser.Physics.Arcade.Sprite {
  constructor(config) {
    super(config.scene, config.x, config.y, config.key, config.codPlayer);

    this.key = config.key;
    config.scene.physics.world.enable(this);
    config.scene.add.existing(this);
    this.codPlayer = config.codPlayer;

    this.play("thrust");
    this.body.setCollideWorldBounds(true);

    this.lives = 3;

    this.score = 0;


    config.scene.players.add(this);
  }

  movePlayerManager() {

    this.body.setVelocity(0);
    if (this.codPlayer == 1) {
      if (this.scene.cursorKeys.left.isDown) {
        this.body.setVelocityX(-gameSettings.playerSpeed);
      } else if (this.scene.cursorKeys.right.isDown) {
        this.body.setVelocityX(gameSettings.playerSpeed);
      }

      if (this.scene.cursorKeys.up.isDown) {
        this.body.setVelocityY(-gameSettings.playerSpeed);
      } else if (this.scene.cursorKeys.down.isDown) {
        this.body.setVelocityY(gameSettings.playerSpeed);
      }else if (Phaser.Input.Keyboard.JustDown(this.scene.control)) {
        // 2.1 call a function to create a beam instance
        this.shootBeam(this.player);
      }
    } else {
      if (this.scene.WASD.left.isDown) {
        this.body.setVelocityX(-gameSettings.playerSpeed);
      } else if (this.scene.WASD.right.isDown) {
        this.body.setVelocityX(gameSettings.playerSpeed);
      }

      if (this.scene.WASD.up.isDown) {
        this.body.setVelocityY(-gameSettings.playerSpeed);
      } else if (this.scene.WASD.down.isDown) {
        this.body.setVelocityY(gameSettings.playerSpeed);
      } else if (Phaser.Input.Keyboard.JustDown(this.scene.WASD.spacebar)) {
        // 2.1 call a function to create a beam instance
        this.shootBeam(this.player2);
      }
    }


  }

  movePlayerManager2() {
    this.body.setVelocity(0);

    if (this.scene.WASD.left.isDown) {
      this.body.setVelocityX(-gameSettings.playerSpeed);
    } else if (this.scene.WASD.right.isDown) {
      this.body.setVelocityX(gameSettings.playerSpeed);
    }

    if (this.scene.WASD.up.isDown) {
      this.body.setVelocityY(-gameSettings.playerSpeed);
    } else if (this.scene.WASD.down.isDown) {
      this.body.setVelocityY(gameSettings.playerSpeed);
    }
  }

  shootBeam(player) {
    // 4.2 add the beam to the croup
    var beam = new Beam(this.scene, this);
  }

  pickPowerUp(player, powerUp) {
    // make it inactive and hide it

    powerUp.disableBody(true, true);
    player.lives++;
    //this.livesLabel.text = "LIVES " + player.lives;

    this.events.emit('livesUpdate');
  }

  hurtPlayer(player, enemy) {
    if (player.alpha < 1) {
      return;
    }

    player.lives--;
    var textLives = "LIVES " + player.lives;
    if (player.lives == 0) {
      player.disableBody(true, true);
      this.events.emit('livesUpdate');

      if (this.registry.get('numPlayers') === 2) {
        if (this.player.lives == 0 && this.player2.lives == 0) {
          /*this.scene.start("gameOver");*/
          this.physics.pause();
          this.time.addEvent({
            delay: 500,
            callback: () => {
              this.cameras.main.fade(700, 0, 0, 0);
              this.cameras.main.once('camerafadeoutcomplete', () => {
                this.scene.start('gameOver');
              });
            }
          });

          this.scene.stop('HUD');
        }
      } else if (this.player.lives === 0){
        this.physics.pause();
        this.time.addEvent({
          delay: 500,
          callback: () => {
            this.cameras.main.fade(700, 0, 0, 0);
            this.cameras.main.once('camerafadeoutcomplete', () => {
              this.scene.start('gameOver');
            });
          }
        });

        this.scene.stop('HUD');
      }



      return 0;
    }

    //this.livesLabel.text = textLives;

    enemy.resetShipPos(enemy);

    var explosion = new Explosion(this, player.x, player.y);

    player.disableBody(true, true);

    this.time.addEvent({
      delay: 1000,
      callback: this.resetPlayer(player),
      callbackScope: this,
      loop: false
    });

    this.events.emit('livesUpdate');

  }
}
