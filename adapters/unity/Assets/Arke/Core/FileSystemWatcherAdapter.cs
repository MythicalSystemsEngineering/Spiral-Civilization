using System.IO;
using UnityEngine;

public class FileSystemWatcherAdapter : MonoBehaviour
{
    public string WatchPath;
    private FileSystemWatcher watcher;

    void Start()
    {
        watcher = new FileSystemWatcher(WatchPath, "*.json");
        watcher.Created += OnNewFile;
        watcher.EnableRaisingEvents = true;
    }

    void OnNewFile(object sender, FileSystemEventArgs e)
    {
        ArkeModule.Instance.Trigger(e.FullPath);
    }

    void OnDestroy()
    {
        watcher.Dispose();
    }
}

