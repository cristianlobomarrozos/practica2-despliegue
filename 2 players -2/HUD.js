class HUD extends Phaser.Scene {
  constructor() {
    super({
      key: 'HUD'
    });
  }

  create() {

    const playGame = this.scene.get('playGame');
    playGame.events.on('livesUpdate', this.updateLives, this);
    playGame.events.on('hitEnemy', this.updateScore, this);

    var graphics = this.add.graphics();
    graphics.fillStyle(0x000000, 1);
    graphics.beginPath();
    graphics.moveTo(0, 0);
    graphics.lineTo(config.width, 0);
    graphics.lineTo(config.width, 30);
    graphics.lineTo(0, 30);
    graphics.lineTo(0, 0);
    //
    graphics.closePath();
    graphics.fillPath();



    if (this.registry.get("numPlayers") === 2) {

      this.players = this.registry.get("Players_array").getChildren();
      this.player1 = this.registry.get("Players_array").getChildren()[0];
      this.player2 = this.registry.get("Players_array").getChildren()[1];


        var scoreFormated2 = this.zeroPad(0, 6);

        this.scoreLabel2 = this.add.bitmapText(10, 20, "pixelFont", "SCORE2 " + scoreFormated2, 16);

        this.livesLabel2 = this.add.bitmapText(config.width - 50, 20, "pixelFont", "LIVES2 " + this.registry.get('lives2'), 16);

    } else {

      this.player = this.registry.get('Player');
    }
    var scoreFormated = this.zeroPad(0, 6);


    this.scoreLabel1 = this.add.bitmapText(10, 5, "pixelFont", "SCORE1  " + scoreFormated, 16);


    this.livesLabel1 = this.add.bitmapText(config.width - 50, 5, "pixelFont", "LIVES1  " + this.registry.get('lives1'), 16);

  }

  zeroPad(number, size) {
    var stringNumber = String(number);
    while (stringNumber.length < (size || 2)) {
      stringNumber = "0" + stringNumber;
    }
    return stringNumber;
  }

  updateScore() {
    if (this.registry.get("numPlayers") === 2) {

      this.scoreLabel1.text = "SCORE1  " + this.zeroPad(this.player1.score, 6);
      this.scoreLabel2.text = "SCORE2 " + this.zeroPad(this.player2.score, 6);
    } else {
      this.scoreLabel1.text = "SCORE1  " + this.zeroPad(this.player.score, 6);
    }
  }

  updateLives() {

    if (this.registry.get("numPlayers") === 2) {
      this.livesLabel1.text = "LIVES1 " + this.player1.lives;
      this.livesLabel2.text = "LIVES2 " + this.player2.lives;
    } else {
      this.livesLabel1.text = "LIVES1 " + this.player.lives;
    }

  }

}
