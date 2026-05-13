---
name: tweak
description: Add an interactive HTML tuning panel to a visual artifact so the user can adjust design parameters with sliders and then bake the selected values back into the final design.
---

# Tweak Skill

## Goal

Turn subjective visual refinement into interactive parameter tuning.

Use when the user says:

- `/tweak`
- `tweak this design`
- `add sliders`
- `let me adjust this visually`
- `bake these changes`
- `apply this tweak patch`

## Supported artifacts

Prefer this skill for:

- HTML slides
- landing pages
- visual cards
- dashboards
- explainer graphics
- diagrams
- static web components

Do not use it for non-visual prose unless the user specifically requests style sliders.

## Default sliders

If the user does not specify sliders, choose 5–8 high-impact controls:

```text
Title size
Body size
Spacing / density
Card width
Border radius
Shadow strength
Accent intensity
Background glow
Letter spacing
Saturation
Contrast
```

## Implementation pattern

Insert a fixed or floating control panel into the HTML artifact.

The control panel should:

1. Use native HTML range inputs.
2. Update CSS variables live.
3. Include a `Bake` button.
4. Generate a copyable patch containing the selected variable values.
5. Avoid external dependencies unless already present.

## CSS variable pattern

Use variables like:

```css
:root {
  --title-size: 42px;
  --body-size: 18px;
  --density: 1;
  --accent-glow: 0.35;
  --letter-spacing: 0px;
  --saturation: 1;
}
```

## Example control panel skeleton

```html
<div id="tweak-panel">
  <label>
    Title size
    <input type="range" min="24" max="72" value="42"
      oninput="setVar('--title-size', this.value + 'px')">
  </label>

  <label>
    Body size
    <input type="range" min="12" max="28" value="18"
      oninput="setVar('--body-size', this.value + 'px')">
  </label>

  <label>
    Density
    <input type="range" min="0.7" max="1.6" step="0.05" value="1"
      oninput="setVar('--density', this.value)">
  </label>

  <button onclick="bakeTweaks()">Bake</button>
  <pre id="tweak-output"></pre>
</div>

<script>
function setVar(name, value) {
  document.documentElement.style.setProperty(name, value);
}

function bakeTweaks() {
  const vars = [
    '--title-size',
    '--body-size',
    '--density',
    '--accent-glow',
    '--letter-spacing',
    '--saturation'
  ];

  const patch = {};
  for (const v of vars) {
    patch[v] = getComputedStyle(document.documentElement)
      .getPropertyValue(v)
      .trim();
  }

  document.getElementById('tweak-output').textContent =
    JSON.stringify({ tweakPatch: patch }, null, 2);
}
</script>
```

## Bake behavior

When the user sends back a patch:

1. Read the artifact file.
2. Apply the selected CSS variable values.
3. Remove the tuning panel unless the user wants to keep it.
4. Preserve the final visual state.
5. Confirm which parameters were baked.

## Guardrails

- Do not destroy existing layout.
- Do not rewrite the whole artifact unless necessary.
- Use CSS variables for easy reversibility.
- Keep the tweak panel isolated from production UI.
- Remove debugging controls after baking unless requested.
