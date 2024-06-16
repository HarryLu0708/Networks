class Node {
  float x, y; 
  float radius; 
  color col; 
  int id;
  
  Node(float x, float y, float radius, color col, int id) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.col = col;
    this.id = id;
  }


  void display() {
    fill(col);
    ellipse(x, y, radius*2, radius*2);
    fill(255);
    textSize(15);
    text(id, x, y);
  }
  
  float getX(){return x;}
  float getY(){return y;}
}

class Link{
  float x_0, y_0, x_1, y_1;
  int start, end;
  
  Link(float x_0, float y_0,float x_1, float y_1, int start, int end){
    this.x_0 = x_0;
    this.y_0 = y_0;
    this.x_1 = x_1;
    this.y_1 = y_1;
    this.start = start;
    this.end = end;
  }
  
  void display() {
    fill(0,0,0);
    line(x_0, y_0, x_1, y_1);
  }
}


ArrayList<Node> nodes;
ArrayList<Link> links;
ArrayList<float[]> positions;
ArrayList<ArrayList<Integer>> adjList;
int numNodes = 5;

void addEdge(int u, int v) {
  adjList.get(u).add(v);
  adjList.get(v).add(u); 
}

void setup() {
  size(1280, 1280);
  adjList = new ArrayList<ArrayList<Integer>>();
  links = new ArrayList<Link>();
  positions = new ArrayList<float[]>(); 
  for (int i = 0; i < numNodes; i++) {
    adjList.add(new ArrayList<Integer>());
  }

  addEdge(0, 1);
  addEdge(0, 2);
  addEdge(1, 2);
  addEdge(1, 3);
  addEdge(2, 4);

  nodes = new ArrayList<Node>();
  for (int i = 0; i < numNodes; i++) {
    float x = random(1280);
    float y = random(1280);
    nodes.add(new Node(x, y, 25, color(random(255), random(255), random(255)), i));
    float[] position = {x, y};
    println(position);
    positions.add(position);
  }
  for(int i=0; i<adjList.size(); i++){
    for(int j=0; j<adjList.get(i).size(); j++){
      int start_id = i;
      int end_id = adjList.get(i).get(j);
      Node start_node = nodes.get(start_id);
      Node end_node = nodes.get(end_id);
      float x_0 = start_node.getX();
      float y_0 = start_node.getY();
      float x_1 = end_node.getX();
      float y_1 = end_node.getY();
      Link link = new Link(x_0, y_0, x_1, y_1, start_id, end_id);
      links.add(link);
    }
  }
}

void draw() {
  background(255);
  
  for (Link n : links) {
    n.display();
  }
  for (Node n : nodes) {
    n.display();
  }
}
