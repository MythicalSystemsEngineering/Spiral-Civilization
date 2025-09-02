using System.IO;
using System.Collections.Generic;
using UnityEngine;
using Newtonsoft.Json.Linq;

public class ArkeModule : MonoBehaviour
{
    public static ArkeModule Instance { get; private set; }
    private Dictionary<string, string> registry;

    void Awake()
    {
        if (Instance != null) Destroy(this);
        Instance = this;
        LoadRegistry();
    }

    void LoadRegistry()
    {
        var text = File.ReadAllText("adapters/unity/arke_registry.json");
        var json = JObject.Parse(text);
        registry = json["glyphs"].ToObject<Dictionary<string, string>>();
    }

    public void Trigger(string capsulePath)
    {
        var glyph = Path.GetFileNameWithoutExtension(capsulePath);
        if (registry.TryGetValue(glyph, out var handlerName))
        {
            var type = System.Type.GetType(handlerName);
            if (type != null && typeof(IGlyphAction).IsAssignableFrom(type))
            {
                var handler = (IGlyphAction)System.Activator.CreateInstance(type);
                handler.Execute(capsulePath, glyph, new string[0]);
            }
            else
            {
                Debug.LogWarning($"Handler '{handlerName}' not found.");
            }
        }
    }
}
