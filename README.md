# Ali-Fathi (version 4): two separate pages

| File | For | Open it to |
|---|---|---|
| `customer.html` | Customers | Log in or sign up, browse restaurants, order, rate dishes, earn rewards |
| `owner.html` | Restaurant owners | Log in or register a restaurant, see charts, orders, menu, feedback, ads |

Each page has its own login screen, colours, fonts and rotating quotes. Customers cannot log in on the owner page and owners cannot log in on the customer page. Each page links to the other.

Both files are standalone (no build step). Keep them in the same folder so the links between them work.

## Customer login picture
The customer login page shows a drawn restaurant scene. To use a real photo instead, save a photo you have the right to use (for example a free one from Unsplash or Pexels) as `restaurant.jpg` in the same folder as `customer.html`. It is picked up automatically, no code change needed. Portrait or square photos about 1200 pixels wide work best. Delete the file to go back to the drawing.

## Logging in
There are no demo accounts. On the customer site (customer.html) press Sign up. On the owner site (owner.html) press Register, search for your restaurant and create the owner account.
## Try both working together (same browser)
1. Open `owner.html`, register as an owner, open Menu, mark a dish sold out, log out.
2. Open `customer.html`, sign up as a customer, open "Hauz Khas Social" (Hauz Khas Village), order a dish.
3. Open `owner.html` again, log in, open Orders and press the status button. The customer's tracker follows.

## Limits (there is no server)
- Accounts, orders, reviews, offers and menu changes are stored in the visitor's own browser. An owner cannot see orders placed on another device.
- Owner charts include generated sample history. A button turns it off.
- Menus are generated from cuisine tags. No payments are taken. Anyone can register as the owner of any restaurant.
For shared data across devices you need a database such as Supabase.

## Deploy free
Netlify Drop: https://app.netlify.com/drop, sign in, drag the whole `Ali-Fathi` folder onto the page.
Your customer link is the site address. The owner portal is the same address followed by /owner.html
To update an existing site: Netlify > your site > Deploys > drag the folder again.
GitHub Pages: upload both files, then Settings > Pages > Deploy from branch `main` / root.

## Newer touches
- Customer: colourful "What are you craving?" cuisine tiles, quick filters (Delivery, Book a table, Budget friendly, Rated 4+), a letter badge on each restaurant page, menu section jump buttons, a cart badge that bounces, a live order tracker with step labels, and confetti when an order is placed.
- Owner: a "Today's goal" ring with an editable daily target, a "Busy hours" chart, and numbers that count up.

## Language, install and shared data

**Tamil.** Press the தமிழ் button (top right) to switch the whole app to Tamil, and EN to switch back. Menus, dish names, restaurant names and cities stay in English because they come from the dataset.

**Install on a phone.** Open the deployed site in Chrome (Android) or Safari (iPhone), then use "Install app" or "Add to Home Screen". The customer site and the owner site install as two separate apps.

**Share data between phones (Supabase).** Without this step each phone only sees its own data.
1. Create a free project at supabase.com.
2. Open SQL Editor, paste everything from `supabase_setup.sql` (in the same folder), and press Run.
3. Open Project Settings > API. Copy the Project URL and the `anon public` key.
4. Open `Ali-Fathi/config.js` and paste them between the quotes.
5. Deploy the `Ali-Fathi` folder to Netlify again.

After that, accounts, orders, order status, reviews, offers and menu changes are shared. The page checks for changes every 5 seconds. This is demo-level security: the anon key sits in the page, so anyone with the site address can read the shared data, including the password hashes. Use fake passwords. For real customers you would add Supabase Auth.

## More features
Coupon codes (WELCOME10, TASTY5, FREEDEL, plus any offer an owner publishes), reward points you can spend at checkout, one-tap reorder, owner Customers page with a Regular badge, Print bill and Kitchen ticket on each order, and a suggested offer for your slowest weekday.

## Languages
The language menu (top right) offers English, Tamil, Hindi, Telugu, Malayalam and Kannada, and remembers the choice. Tamil covers almost every screen. Hindi, Telugu, Malayalam and Kannada cover the main customer and owner screens, and anything not yet translated stays in English. Restaurant names, cities, cuisines and dish names always stay in English.

## Who can use which site
Both login pages have an "I am a customer / I own a restaurant" switch at the top. A customer account works only on the customer site. An owner account works on both: the owner site for the dashboard, and the customer site to order food, with "My restaurant" and "Customer site" links to move between them.

## Owner access
The owner site is only for the owner, named Bashaa. The first person to register with the name Bashaa creates the single owner account, so register it yourself straight after deploying. After that the Register button disappears and only that account can log in to the owner site. Customers can sign up and log in freely on the customer site. This check runs in the page, so for strong protection you would need a real login service such as Supabase Auth.

Ali-Fathi is already in the restaurant list (Coimbatore, RS Puram), so the owner registration picks it automatically. Its rating and votes start empty because it is a new restaurant.

## Table QR codes
On the owner site open **Table QR**. Paste the public address of your customer site (for example your Netlify address), choose how many tables you have and press **Print table cards**. Each card has its own QR code. Guests scan it and land on your menu, and orders placed from a table card carry the table number in the order note. **Download QR (SVG)** saves a single code for posters or menus. The code is generated inside the page, so it works offline. Always test one with your phone before printing.

## Live order tracking
Each order in progress shows a countdown and a map with the delivery rider moving from the restaurant to the customer (pickup orders show the countdown only). The owner sees the same view on the Orders page. Timing is simulated: a demo order completes in 5 minutes. To change the pace, edit `ETA_MIN` in customer.html and owner.html (for example 35 for real-time pacing). If the owner presses a status button, the countdown is replaced by the status until the order is finished.
