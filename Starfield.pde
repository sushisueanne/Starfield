Particle [] momo = new Particle[100];

void setup()
{
size(400,400);
for (int i=2; i<momo.length;i++){
	momo[i]=new NormalParticle();
}
momo[0]= new OddballParticle();
momo[1]= new JumboParticle();
}

void draw()
{
	background(0);
	for (int i=0; i<momo.length;i++){
		momo[i].wrap();
		momo[i].show();
		momo[i].move();
	}
	
}

class NormalParticle implements Particle
{
	double x;
    double y;
    double angle;
    double speed;
    int r;
    int g;
    int b;

	NormalParticle(){
		x=200;
		y=200;
		angle=(Math.random()*(Math.PI*2));
		r=(int)(Math.random()*255);
		g=(int)(Math.random()*255);
		b=(int)(Math.random()*255);

		speed=(Math.random()*5);

	}
	
	public void move(){
		x+=Math.cos(angle)*speed;
		y+=Math.sin(angle)*speed;
	}

	public void show(){
		noStroke();
		fill(r,g,b);
		ellipse((int)x,(int)y,5,5);
	}
	public void wrap(){
		if (x<0 || x>400 || y<0 || y>400) {
			x=200;
			y=200;
		}
	}
}

interface Particle
{
	public void show();
	public void move();
	public void wrap();
}
class OddballParticle implements Particle
{
	double x;
    double y;
    double angle;
    double speed;

	OddballParticle(){
		x=200;
		y=200;
		angle=(Math.random()*(Math.PI*2));
		speed=(Math.random()*5);

	}
	
	public void move(){
		x+=Math.cos(angle)*speed;
		y+=Math.sin(angle)*speed;
		angle+=0.04;
	}

	public void show(){
		noStroke();
		fill(255);
		ellipse((int)x,(int)y,10,10);
	}
	public void wrap(){
		if (x<0 || x>400 || y<0 || y>400) {
			x=200;
			y=200;
		}
	}
}
class JumboParticle extends NormalParticle
{
	public void show(){
		noStroke();
		fill(200,60,80);
		ellipse((int)x,(int)y,15,15);
	}
}

