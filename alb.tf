

resource "aws_lb" "alb-demo2" {
  name               = "alb-demo2"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.alb-sg.id}"]
  subnets          = ["subnet-0f74db4c67b0593ee", 
                      "subnet-09a76e20be7b614d2",
                      "subnet-0e436dcc55fa13003"]
}

resource "aws_lb_target_group" "demo-tg-1" {
  name     = "demo-tg-1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id
}

resource "aws_lb_target_group_attachment" "demo-alb" {
  target_group_arn = aws_lb_target_group.demo-tg-1.arn
  target_id        = aws_instance.apps.id
  port             = 80

  # depends_on = [
  #   aws_instance.webserver1,
  # ]
}



resource "aws_lb_listener" "demo-listener" {
  load_balancer_arn = aws_lb.alb-demo2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo-tg-1.arn
  }
}
