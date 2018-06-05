import { Component, OnInit } from "@angular/core";
import "rxjs/operators/take";
import { NavService } from "../../services/nav.service";

@Component({
  selector: "app-welcome",
  templateUrl: "./welcome.component.html",
  styleUrls: ["./welcome.component.scss"]
})
export class WelcomeComponent implements OnInit {
  welcomeMessage = "Welcome";
  productTitle = "Cireson Control Center Setup";

  constructor(private navService: NavService) {}

  ngOnInit() {
    this.navService.setBottomLinks(null, 'License', null, 'Let\'s get started!')
  }
}
