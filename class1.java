import java.awt.BorderLayout;
import java.awt.Dimension;
import javax.swing.JFrame;

public class Main
{
    public static int WIDTH = 400;
    public static int HEIGHT = 300;
    public static int WEIGHT = WIDTH * HEIGHT;

    public static void main(String[] args)
    {
        Game game = new Game();
        game.setPreferredSize(WIDTH, HEIGHT);
        JFrame frame = new JFrame(Game.NAME);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(BorderLayout());
        frame.add(game, BorderLayout.CENTER);
        frame.pack();
        frame.setResizable(false);
        frame.setVisible(true);
        game.start();
    }
}