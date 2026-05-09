# ArdaFuat Showroom v1.2.0

ArdaFuat Showroom is a standalone QBCore vehicle showroom / catalog resource for FiveM servers.

It lets players browse a clean vehicle catalog through a modern NUI interface opened from an NPC with `qb-target`. The resource is designed as a safe visual catalog layer only. It does **not** handle purchases, test drives, payments, garage registration, vehicle keys, stock transactions, or database writes. This makes it easy to use alongside an existing dealership system or to integrate into a custom dealership workflow later.

## v1.2.0 Update

This release expands the vehicle catalog to **670 vehicles**.

The new catalog is built from GTACars data and includes local vehicle images, vehicle detail information, category filtering, search support, performance values, trunk information, brand data, and extended vehicle metadata.

Some vehicles in the current 670 vehicle catalog may not be ideal for serious roleplay servers. These vehicles are intentionally left in the catalog for now so server owners can review the full list first. Non-roleplay-friendly vehicles can be removed or filtered in future updates.

---

## Features

- Standalone QBCore showroom / catalog resource.
- NPC interaction through `qb-target`.
- Modern NUI vehicle catalog interface.
- 670 configured vehicles in v1.2.0.
- Config based vehicle list.
- JSON based vehicle detail data.
- Search support.
- Category filtering.
- Vehicle detail panel.
- Brand logo support.
- Local vehicle image support.
- GTACars image/data support.
- Trunk capacity display.
- Seat count display.
- Drivetrain, mass, dimensions and vehicle metadata support.
- Performance bars.
- Turkish and English locale support.
- GitHub update checker.
- Console reload command.
- No database requirement.
- No purchase system.
- No test drive system.
- No garage integration.
- No vehicle key integration.

---

## Requirements

- `qb-core`
- `qb-target`

Optional for development / catalog tools:

- Node.js
- PowerShell

The runtime resource itself does not require a database.

---

## Installation

1. Delete the old `af-showroom` folder completely.
2. Place the new `af-showroom` folder inside your server resources folder.
3. Make sure the folder name is exactly:

    ```text
    af-showroom
    ```

4. Add this line to your `server.cfg`:

    ```cfg
    ensure af-showroom
    ```

5. Restart your server or run:

    ```text
    refresh
    ensure af-showroom
    ```

---

## Updating From an Older Version

When updating from an older release, replacing only a few files is not recommended because the catalog, NUI, image data, version checker, locales and generated GTACars data may depend on each other.

Recommended update steps:

1. Stop the resource.
2. Back up your current `af-showroom` folder.
3. Delete the old folder from your resources directory.
4. Add the new v1.2.0 folder.
5. Re-apply your own custom changes if you had any.
6. Start the resource again.

Important files to keep in sync when releasing or updating:

- `fxmanifest.lua` version
- `Config.Version` in `config.lua`
- `version.json`
- GitHub release tag

---

## Basic Logic

The resource uses two main data sources:

1. `config.lua`
2. `html/vehicledata.json`

`config.lua` controls which vehicles appear in the catalog.

`html/vehicledata.json` provides additional data such as images, descriptions, brand logos, trunk capacity, seat count, drivetrain, mass, dimensions, top speed, lap time, race class, release date and performance values.

A vehicle must exist in `Config.Vehicles` to appear in the menu. A vehicle existing only in `html/vehicledata.json` will not be displayed.

Vehicle detail data is matched by `model` / `spawncode`. The names must match exactly.

---

## Vehicle Catalog

v1.2.0 includes **670 vehicles** in the configured showroom catalog.

Included default categories:

- Compacts
- Coupes
- Motorcycles
- Muscle
- Off-Road
- SUVs
- Sedans
- Sports
- Sports Classics
- Supers
- Vans

The catalog can be edited from `config.lua`.

Example vehicle entry:

```lua
{
    model = 'adder',
    brand = 'Truffade',
    name = 'Adder',
    category = 'Supers',
    price = 280000,
    stock = 1
}
```

Only vehicles inside `Config.Vehicles` will be shown in the NUI catalog.

---

## Removing Non-RP-Friendly Vehicles

The v1.2.0 catalog intentionally includes a very large vehicle list. Some vehicles may not be suitable for all roleplay servers.

To remove a vehicle from the showroom:

1. Open `config.lua`.
2. Find the vehicle inside `Config.Vehicles`.
3. Delete that vehicle block.
4. Restart the resource or run the console reload command if the resource is already running.

You do not have to delete the vehicle from `html/vehicledata.json` unless you also want to clean unused detail data.

The recommended approach is:

- Keep `vehicledata.json` as a full detail database.
- Control what players can see from `Config.Vehicles`.
- Remove or hide unrealistic vehicles from `Config.Vehicles` first.

---

## Locale Support

The resource supports multiple languages through the `locales` folder.

Available languages:

- `tr` Turkish
- `en` English

Change the language in `config.lua`:

```lua
Config.Locale = 'tr'
```

or:

```lua
Config.Locale = 'en'
```

Locale files:

```text
locales/tr.lua
locales/en.lua
```

Most UI, target, console, and update checker texts are pulled from the locale files. Technical values such as event names, resource names, callbacks, model names, and spawncodes are not translated.

Existing vehicle categories from the config are also mapped in the locale files, so Turkish config categories can be displayed properly in the English UI.

---

## GitHub Update Checker

The resource checks the latest version from GitHub when the server starts.

Configuration in `config.lua`:

```lua
Config.Version = '1.2.0'

Config.UpdateChecker = {
    enabled = true,
    url = 'https://raw.githubusercontent.com/ArdaFuat/af-showroom/main/version.json',
    repository = 'https://github.com/ArdaFuat/af-showroom'
}
```

The public version file is:

```text
version.json
```

Example `version.json` for v1.2.0:

```json
{
  "version": "1.2.0",
  "changelog": "Vehicle catalog expanded to 670 vehicles. Some non-roleplay-friendly vehicles may be removed in future updates.",
  "url": "https://github.com/ArdaFuat/af-showroom"
}
```

When you release a new version, update these values together:

- `fxmanifest.lua` version
- `Config.Version`
- `version.json`
- GitHub release tag

Version flow:

- `1.0.0` Initial public release
- `1.1.0` Locale & Update Checker Update
- `1.2.0` 670 Vehicle GTACars Catalog Update

---

## Commands

### `/showroom`

Debug command for opening the catalog quickly.

This command only exists when `Config.Debug = true`.

### `showroomreload`

Console-only command.

Reloads catalog/detail data without restarting the whole server.

Recommended after editing:

- `config.lua`
- `html/vehicledata.json`
- vehicle image paths
- catalog data generated by tools

---

## GTACars Image Sync

You can automatically fill vehicle images from GTACars by using the included sync tool.

The tool reads `html/vehicledata.json`, uses each vehicle `spawncode` / `model`, opens the public GTACars page, reads the `og:image` meta tag, downloads the image into `html/vehicle-images/`, and updates the vehicle `image` field.

Run from the resource folder:

```bash
node tools/sync-gtacars-images.js --force
```

On Windows you can also run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/sync-gtacars-images.ps1 -Force
```

Useful options:

```text
--force        Replace existing image values with GTACars images.
--dry-run      Check what would happen without writing files.
--remote-only  Store GTACars image URLs instead of downloading local copies.
--delay=750    Wait between requests in milliseconds.
--limit=10     Test only the first 10 vehicles.
```

After the sync finishes, restart the resource or run the console command:

```text
showroomreload
```

The latest sync report is saved here:

```text
html/vehicle-images/sync-report.json
```

---

## GTACars Full Catalog Builder

You can rebuild the whole showroom catalog from GTACars using the selected vehicle classes.

Default classes:

```text
compacts, coupe, motorcycle, muscle, off_road, van, suv, super, sport_classic, sport, sedan
```

Run a safe test without applying changes:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/build-gtacars-catalog.ps1 -DryRun -SkipImages
```

Build and apply the full catalog:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/build-gtacars-catalog.ps1 -Apply
```

The builder:

- Reads public GTACars vehicle pages from the sitemap.
- Filters the selected classes.
- Generates `Config.Vehicles`.
- Generates `html/vehicledata.json`.
- Downloads local vehicle images into `html/vehicle-images/`.
- Preserves existing price/stock where the model already exists.
- Creates backups in `tools/generated/` before applying.

The latest full catalog report is saved here:

```text
tools/generated/gtacars-catalog-report.json
```

---

## What This Resource Does Not Do

This resource intentionally does not include:

- Vehicle purchase
- Test drive
- Player payment
- Dealership stock transaction
- Vehicle database registration
- Garage registration
- Vehicle key assignment
- Job restriction
- Dealer employee panel
- Finance / installment system
- Vehicle spawning
- Vehicle deletion
- Plate generation

These are not bugs. The first scope of the resource is only a showroom/catalog display system.

---

## File Structure

```text
af-showroom/
├── fxmanifest.lua
├── config.lua
├── client.lua
├── server.lua
├── README.md
├── LICENSE
├── version.json
├── locales/
│   ├── tr.lua
│   └── en.lua
├── html/
│   ├── index.html
│   ├── style.css
│   ├── app.js
│   ├── vehicledata.json
│   └── vehicle-images/
│       └── vehicle image files
└── tools/
    ├── sync-gtacars-images.js
    ├── sync-gtacars-images.ps1
    ├── build-gtacars-catalog.ps1
    └── generated/
```

---

## Recommended Use

Use this resource as a clean showroom/catalog layer for your dealership area.

Recommended flow:

1. Keep this resource as the visual catalog.
2. Keep purchase/test drive/stock logic in a separate dealership system.
3. Use `Config.Vehicles` to decide which vehicles are visible.
4. Use `html/vehicledata.json` as the detail database.
5. Integrate purchase/test drive logic later only when the catalog is stable.

This structure keeps the showroom safe and prevents unwanted money, key, garage, stock or database issues.

---

## Troubleshooting

### Catalog does not open

Check that:

- `qb-core` is started before `af-showroom`.
- `qb-target` is started before `af-showroom`.
- The resource folder name is `af-showroom`.
- The resource is ensured in `server.cfg`.

### A vehicle does not appear in the menu

Check that:

- The vehicle exists in `Config.Vehicles`.
- The model/spawncode is written correctly.
- The resource was restarted or `showroomreload` was used.

### Vehicle detail data is missing

Check that:

- The vehicle exists in `html/vehicledata.json`.
- The `model` / `spawncode` matches the config entry exactly.
- The JSON file is valid.

### Vehicle image is missing

Check that:

- The image file exists in `html/vehicle-images/`.
- The image path in `html/vehicledata.json` is correct.
- The file is included in `fxmanifest.lua` under `files`.

---

## Development Notes

- Keep event names and callbacks stable when changing UI text.
- Put user-facing text into locale files instead of hardcoding it.
- Use `Config.Vehicles` as the visible catalog source.
- Use `vehicledata.json` as the detail and metadata source.
- Test catalog changes with a small vehicle list before rebuilding the full catalog.
- Back up generated files before applying a new GTACars build.

---

## License

MIT License.

---

## Version

Current version: `v1.2.0`

Release name: `670 Vehicle GTACars Catalog Update`
