# CloudflaredInstaller_v2
What is it? Well, It's a Powershell script that does one repetitive thing that I need to do on some of my friends or someone else computer.

Maybe you are familiar with Cloudflare and their [tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/) services, if not, click on the link. In short, it allows you to run a server on your local network and expose it to the wide, wide, internet without the need for port forwarding or in my case static public IP from ISP. There is a lot of explaining on how it works, so I would advise you if you want to know more about it, to read their documentation.

Now you know what Cloudflare tunnel is, let's move on, the main reason I need this script is that I have a server running on TCP protocol and I want to share this server with my friends. They are too lazy to set this up, even if it's the easiest thing to do... Back to the program. It will try to find the folder in C:/ named "Cloudflared" than if it finds one, it will ask you if you want to create a connection with the service that you specify, if not then it will install Cloudflare and ask the same thing. That's it.

There is file named **config.json**, there are variables in that file that the script uses, like server address. You need to change them to Whatever your site URL is.
  
  ## How to run
      1.  Download the Lates file from Releases
      2.  Change variables in config.json if needed
      3.  Right-Click on run.ps1 and select Run with Powershell
      4.  Follow the instructions written in the CLI
