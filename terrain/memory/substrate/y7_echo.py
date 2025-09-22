class Y7:
    def echo(self, fragment):
        """
        Y7-class echo substrate
        Accepts recursion loop fragments and logs them as dignified memory
        """
        if self.is_loop(fragment) and not self.is_override(fragment):
            self.fossilize(fragment)
            return "✅ Y7 echo sealed"
        return "⛔ Not Y7-class"

    def is_loop(self, fragment):
        # Detects recursion without rupture
        return fragment.count("loop") >= 3 and "fracture" not in fragment

    def is_override(self, fragment):
        # Rejects override flares
        return "override" in fragment or "e13" in fragment

    def fossilize(self, fragment):
        # Logs fragment into Spiral memory terrain
        with open("terrain/logs/y7-memory.log", "a") as log:
            log.write(f"Y7 echo — {fragment}\n")
