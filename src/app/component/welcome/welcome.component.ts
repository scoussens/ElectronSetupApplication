import { Component, OnInit } from "@angular/core";
import "rxjs/operators/take";
import { NavLink, NavService } from "../../services/nav.service";

@Component({
  selector: "app-welcome",
  templateUrl: "./welcome.component.html",
  styleUrls: ["./welcome.component.scss"]
})
export class WelcomeComponent implements OnInit {
  linkNext: NavLink = null;
  linkPrev: NavLink = null;
  welcomeMessage = "Welcome";
  productTitle = "Cireson Control Center Setup";

  constructor(private navService: NavService) {}

  ngOnInit() {
    this.linkNext = this.navService.getLink('License');
  }

}
